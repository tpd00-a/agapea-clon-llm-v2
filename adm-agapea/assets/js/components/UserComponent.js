import { BaseCrudComponent } from './BaseCrudComponent.js';
import { UserService } from '../services/UserService.js';

export class UserComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new UserService(),
            title: 'Usuarios (Staff)',
            columns: [{key:'id',label:'ID'},{key:'name',label:'Nombre'},{key:'email',label:'Email'}],
            formFields: `<div class='form-group'><label>Nombre</label><input type='text' name='name' class='form-control' required></div>
                         <div class='form-group'><label>Email</label><input type='email' name='email' class='form-control' required></div>
                         <div class='form-group'><label>Password</label><input type='password' name='password' class='form-control'></div>`
        });
    }
}