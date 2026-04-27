import { BaseLayout } from './BaseLayout.js';
import { UiStore } from '../core/UiStore.js';

export class BaseCrudComponent {
    constructor(config) {
        this.service = config.service;
        this.title = config.title;
        this.columns = config.columns; // [{key: 'id', label: 'ID', sortable: true}, ...]
        this.formFields = config.formFields; // HTML string or function
        
        this.state = {
            data: [],
            meta: { total: 0, page: 1, per_page: 10 },
            search: '',
            sort: '',
            loading: false
        };
    }

    async render(container) {
        this.container = container;
        this.container.innerHTML = BaseLayout.render(`
            <div class="crud-header" style="display:flex; justify-content:space-between; align-items:center; margin-bottom: 20px;">
                <h2>${this.title}</h2>
                <button id="btn-create" class="btn btn-primary"><i class="fas fa-plus"></i> Nuevo</button>
            </div>
            
            <div class="card">
                <div style="margin-bottom: 15px;">
                    <input type="text" id="search-input" class="form-control" placeholder="Buscar..." style="max-width: 300px;">
                </div>
                <div class="table-responsive">
                    <table id="crud-table">
                        <thead>
                            <tr>
                                ${this.columns.map(col => `
                                    <th data-sort="${col.key}" class="${col.sortable ? 'sortable' : ''}">
                                        ${col.label}
                                        ${col.sortable ? '<i class="fas fa-sort"></i>' : ''}
                                    </th>
                                `).join('')}
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="crud-tbody">
                            <tr><td colspan="${this.columns.length + 1}">Cargando...</td></tr>
                        </tbody>
                    </table>
                </div>
                <div id="crud-pagination" class="pagination"></div>
            </div>
            
            <!-- Modal (Slide panel) -->
            <div id="form-panel" class="panel-overlay" style="display:none;">
                <div class="side-panel">
                    <div class="panel-header">
                        <h3 id="form-title">Crear</h3>
                        <button id="btn-close-panel" class="btn btn-secondary"><i class="fas fa-times"></i></button>
                    </div>
                    <div class="panel-body">
                        <form id="crud-form">
                            <input type="hidden" id="entity-id">
                            <div id="form-fields-container"></div>
                        </form>
                    </div>
                    <div class="panel-footer">
                        <button id="btn-save" class="btn btn-primary" form="crud-form">Guardar</button>
                    </div>
                </div>
            </div>
        `);
        
        BaseLayout.attachEvents();
        this.attachEvents();
        await this.loadData();
    }

    attachEvents() {
        // Search debounce
        const searchInput = document.getElementById('search-input');
        const debouncedSearch = UiStore.debounce(() => {
            this.state.search = searchInput.value;
            this.state.page = 1;
            this.loadData();
        }, 300);
        searchInput.addEventListener('keyup', debouncedSearch);

        // Sorting
        document.querySelectorAll('th.sortable').forEach(th => {
            th.addEventListener('click', () => {
                const key = th.getAttribute('data-sort');
                if (this.state.sort === `${key}_asc`) {
                    this.state.sort = `${key}_desc`;
                } else if (this.state.sort === `${key}_desc`) {
                    this.state.sort = '';
                } else {
                    this.state.sort = `${key}_asc`;
                }
                this.loadData();
            });
        });

        // Panel events
        document.getElementById('btn-create').addEventListener('click', () => this.openForm());
        document.getElementById('btn-close-panel').addEventListener('click', () => this.closeForm());

        // Form submit
        const form = document.getElementById('crud-form');
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            await this.saveForm(new FormData(form));
        });
    }

    async loadData() {
        try {
            const tbody = document.getElementById('crud-tbody');
            tbody.innerHTML = `<tr><td colspan="${this.columns.length + 1}">Cargando...</td></tr>`;
            
            const response = await this.service.getAll(this.state.page, this.state.meta.per_page, this.state.search, this.state.sort);
            this.state.data = response.data;
            this.state.meta = response.meta || { total: response.data.length, page: 1, per_page: 10 };
            
            this.renderTable();
            this.renderPagination();
        } catch (error) {
            UiStore.toast('Error al cargar datos', 'error');
        }
    }

    renderTable() {
        const tbody = document.getElementById('crud-tbody');
        if (this.state.data.length === 0) {
            tbody.innerHTML = `<tr><td colspan="${this.columns.length + 1}">No se encontraron registros.</td></tr>`;
            return;
        }

        tbody.innerHTML = this.state.data.map(item => `
            <tr>
                ${this.columns.map(col => `<td>${this.renderCell(item, col)}</td>`).join('')}
                <td>
                    <button class="btn btn-secondary btn-sm btn-edit" data-id="${item.id}"><i class="fas fa-edit"></i></button>
                    <button class="btn btn-danger btn-sm btn-delete" data-id="${item.id}"><i class="fas fa-trash"></i></button>
                </td>
            </tr>
        `).join('');

        // Attach action events
        document.querySelectorAll('.btn-edit').forEach(btn => {
            btn.addEventListener('click', () => this.openForm(btn.getAttribute('data-id')));
        });
        document.querySelectorAll('.btn-delete').forEach(btn => {
            btn.addEventListener('click', () => this.deleteRecord(btn.getAttribute('data-id')));
        });
    }

    renderCell(item, col) {
        if (col.render) return col.render(item);
        if (col.key.includes('.')) {
            const keys = col.key.split('.');
            let val = item;
            for(let k of keys) {
                if(!val) break;
                val = val[k];
            }
            return val || '';
        }
        return item[col.key] || '';
    }

    renderPagination() {
        const container = document.getElementById('crud-pagination');
        if (!this.state.meta || !this.state.meta.total) {
            container.innerHTML = '';
            return;
        }

        const totalPages = Math.ceil(this.state.meta.total / this.state.meta.per_page);
        if (totalPages <= 1) {
            container.innerHTML = '';
            return;
        }

        let html = '';
        for (let i = 1; i <= totalPages; i++) {
            html += `<button class="${i === this.state.page ? 'active' : ''}" data-page="${i}">${i}</button>`;
        }
        container.innerHTML = html;

        container.querySelectorAll('button').forEach(btn => {
            btn.addEventListener('click', () => {
                this.state.page = parseInt(btn.getAttribute('data-page'));
                this.loadData();
            });
        });
    }

    async openForm(id = null) {
        const panel = document.getElementById('form-panel');
        const title = document.getElementById('form-title');
        const container = document.getElementById('form-fields-container');
        document.getElementById('crud-form').reset();
        
        container.innerHTML = typeof this.formFields === 'function' ? await this.formFields(id) : this.formFields;
        
        if (id) {
            title.textContent = 'Editar Registro';
            document.getElementById('entity-id').value = id;
            try {
                const response = await this.service.getById(id);
                this.populateForm(response.data);
            } catch(e) {
                UiStore.toast('Error al cargar registro', 'error');
                return;
            }
        } else {
            title.textContent = 'Nuevo Registro';
            document.getElementById('entity-id').value = '';
        }

        panel.style.display = 'flex';
    }

    closeForm() {
        document.getElementById('form-panel').style.display = 'none';
    }

    populateForm(data) {
        const form = document.getElementById('crud-form');
        for (const key in data) {
            const input = form.elements[key];
            if (input) {
                if (input.type === 'checkbox') {
                    input.checked = data[key];
                } else {
                    input.value = data[key];
                }
            }
        }
    }

    async saveForm(formData) {
        const id = document.getElementById('entity-id').value;
        const dataObj = Object.fromEntries(formData.entries());
        // Handle checkboxes missing in formData
        document.querySelectorAll('#crud-form input[type="checkbox"]').forEach(cb => {
            dataObj[cb.name] = cb.checked;
        });

        const btn = document.getElementById('btn-save');
        btn.disabled = true;

        try {
            if (id) {
                await this.service.update(id, dataObj);
                UiStore.toast('Actualizado correctamente');
            } else {
                await this.service.create(dataObj);
                UiStore.toast('Creado correctamente');
            }
            this.closeForm();
            this.loadData();
        } catch (e) {
            UiStore.toast(e.message, 'error');
        } finally {
            btn.disabled = false;
        }
    }

    async deleteRecord(id) {
        const confirmed = await UiStore.confirmModal('Eliminar', '¿Estás seguro de que deseas eliminar este registro?');
        if (confirmed) {
            try {
                await this.service.destroy(id);
                UiStore.toast('Eliminado correctamente');
                this.loadData();
            } catch (e) {
                UiStore.toast(e.message, 'error');
            }
        }
    }
}
