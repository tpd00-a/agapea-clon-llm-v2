import { BaseCrudComponent } from './BaseCrudComponent.js';
import { AuthorService } from '../services/AuthorService.js';

export class AuthorComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new AuthorService(),
            title: 'Autores',
            columns: [{key:'id',label:'ID',sortable:true},{key:'name',label:'Nombre',sortable:true}],
            formFields: `<div class='form-group'><label>Nombre</label><input type='text' name='name' class='form-control' required></div><div class='form-group'><label>Biografía</label><textarea name='bio' class='form-control' rows='4'></textarea></div>`
        });
    }
}