import { BaseCrudComponent } from './BaseCrudComponent.js';
import { BookService } from '../services/BookService.js';
import { CategoryService } from '../services/CategoryService.js';
import { AuthorService } from '../services/AuthorService.js';
import { PublisherService } from '../services/PublisherService.js';
import { TagService } from '../services/TagService.js';

export class BookComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new BookService(),
            title: 'Libros',
            columns: [
                { key: 'id', label: 'ID', sortable: true },
                { key: 'title', label: 'Título', sortable: true },
                { key: 'isbn', label: 'ISBN' },
                { key: 'price', label: 'Precio', sortable: true },
                { key: 'stock', label: 'Stock', sortable: true }
            ],
            formFields: async (id) => await this.loadFormOptions()
        });
    }

    async loadFormOptions() {
        const [cats, auths, pubs, tags] = await Promise.all([
            new CategoryService().getAll(1, 1000),
            new AuthorService().getAll(1, 1000),
            new PublisherService().getAll(1, 1000),
            new TagService().getAll(1, 1000)
        ]);

        return `
            <div class="form-group">
                <label>Título</label>
                <input type="text" name="title" class="form-control" required>
            </div>
            <div class="form-group">
                <label>ISBN</label>
                <input type="text" name="isbn" class="form-control" required>
            </div>
            
            <div style="display:flex; gap: 10px;">
                <div class="form-group" style="flex:1;">
                    <label>Categoría</label>
                    <select name="category_id" class="form-control" required>
                        <option value="">Selecciona...</option>
                        ${cats.data.map(c => `<option value="${c.id}">${c.name}</option>`).join('')}
                    </select>
                </div>
                <div class="form-group" style="flex:1;">
                    <label>Autor</label>
                    <select name="author_id" class="form-control" required>
                        <option value="">Selecciona...</option>
                        ${auths.data.map(a => `<option value="${a.id}">${a.name}</option>`).join('')}
                    </select>
                </div>
            </div>

            <div style="display:flex; gap: 10px;">
                <div class="form-group" style="flex:1;">
                    <label>Editorial</label>
                    <select name="publisher_id" class="form-control" required>
                        <option value="">Selecciona...</option>
                        ${pubs.data.map(p => `<option value="${p.id}">${p.name}</option>`).join('')}
                    </select>
                </div>
                <div class="form-group" style="flex:1;">
                    <label>Precio (€)</label>
                    <input type="number" step="0.01" name="price" class="form-control" required>
                </div>
            </div>
            
            <div class="form-group">
                <label>Stock</label>
                <input type="number" name="stock" class="form-control" required>
            </div>

            <div class="form-group">
                <label>Páginas / Año / Idioma</label>
                <div style="display:flex; gap:10px;">
                    <input type="number" name="pages" placeholder="Págs" class="form-control">
                    <input type="number" name="year" placeholder="Año" class="form-control">
                    <input type="text" name="language" placeholder="Idioma" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <label>Etiquetas (Control + Click para múltiple)</label>
                <select name="tags[]" class="form-control" multiple style="height: 100px;">
                    ${tags.data.map(t => `<option value="${t.id}">${t.name}</option>`).join('')}
                </select>
            </div>

            <div class="form-group">
                <label>Imagen de Portada (URL)</label>
                <input type="text" name="cover_image" id="cover-input" class="form-control">
                <img id="cover-preview" class="img-preview" src="" style="display:none;" />
            </div>

            <div class="form-group">
                <label>Descripción</label>
                <textarea name="description" class="form-control" rows="4"></textarea>
            </div>
            
            <div class="form-group">
                <label><input type="checkbox" name="is_new"> Es Novedad</label>
                <label style="margin-left:15px;"><input type="checkbox" name="is_bestseller"> Bestseller</label>
            </div>
        `;
    }

    populateForm(data) {
        super.populateForm(data);
        const img = document.getElementById('cover-preview');
        const input = document.getElementById('cover-input');
        
        if (data.cover_image) {
            img.src = data.cover_image;
            img.style.display = 'block';
        }

        input.addEventListener('input', (e) => {
            img.src = e.target.value;
            img.style.display = e.target.value ? 'block' : 'none';
        });

        // Populate multiple select
        if (data.tags) {
            const select = document.querySelector('select[name="tags[]"]');
            const tagIds = data.tags.map(t => t.id.toString());
            Array.from(select.options).forEach(opt => {
                opt.selected = tagIds.includes(opt.value);
            });
        }
    }

    async saveForm(formData) {
        // Enforce multiple select mapping
        const select = document.querySelector('select[name="tags[]"]');
        if (select) {
            const selectedVals = Array.from(select.selectedOptions).map(opt => opt.value);
            formData.delete('tags[]'); // Limpiar si existe (fetch behavior varries)
            selectedVals.forEach(v => formData.append('tags[]', v));
        }

        await super.saveForm(formData);
    }
}
