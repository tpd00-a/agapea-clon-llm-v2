import { BaseCrudComponent } from './BaseCrudComponent.js';
import { TagService } from '../services/TagService.js';

export class TagComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new TagService(),
            title: 'Etiquetas',
            columns: [{key:'id',label:'ID',sortable:true},{key:'name',label:'Nombre',sortable:true}],
            formFields: `<div class='form-group'><label>Nombre</label><input type='text' name='name' class='form-control' required></div>`
        });
    }
}