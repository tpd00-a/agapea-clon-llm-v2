import { BaseCrudComponent } from './BaseCrudComponent.js';
import { PublisherService } from '../services/PublisherService.js';

export class PublisherComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new PublisherService(),
            title: 'Editoriales',
            columns: [
                { key: 'id', label: 'ID', sortable: true },
                { key: 'name', label: 'Nombre', sortable: true }
            ],
            formFields: `
                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
            `
        });
    }
}
