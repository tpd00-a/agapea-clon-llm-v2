import { BaseCrudComponent } from './BaseCrudComponent.js';
import { CategoryService } from '../services/CategoryService.js';

export class CategoryComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new CategoryService(),
            title: 'Categorías',
            columns: [
                { key: 'id', label: 'ID', sortable: true },
                { key: 'name', label: 'Nombre', sortable: true },
                { key: 'slug', label: 'Slug', sortable: true }
            ],
            formFields: `
                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Slug</label>
                    <input type="text" name="slug" class="form-control" required>
                </div>
            `
        });
    }
}
