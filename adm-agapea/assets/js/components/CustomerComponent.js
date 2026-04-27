import { BaseCrudComponent } from './BaseCrudComponent.js';
import { CustomerService } from '../services/CustomerService.js';

export class CustomerComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new CustomerService(),
            title: 'Clientes',
            columns: [{key:'id',label:'ID'},{key:'first_name',label:'Nombre'},{key:'last_name',label:'Apellidos'},{key:'email',label:'Email'}],
            formFields: `<div class='form-group'><label>NIF</label><input type='text' name='nif' class='form-control'></div>
                         <div class='form-group'><label>Nombre</label><input type='text' name='first_name' class='form-control' required></div>
                         <div class='form-group'><label>Apellidos</label><input type='text' name='last_name' class='form-control' required></div>
                         <div class='form-group'><label>Email</label><input type='email' name='email' class='form-control' required></div>
                         <div class='form-group'><label>Teléfono</label><input type='text' name='phone' class='form-control'></div>`
        });
    }
}