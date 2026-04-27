import { BaseCrudComponent } from './BaseCrudComponent.js';
import { CouponService } from '../services/CouponService.js';

export class CouponComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new CouponService(),
            title: 'Cupones',
            columns: [{key:'id',label:'ID'},{key:'code',label:'Código'},{key:'discount_pct',label:'% Descuento'},{key:'is_active',label:'Activo', render: (i) => i.is_active ? 'Sí' : 'No'}],
            formFields: `<div class='form-group'><label>Código</label><input type='text' name='code' class='form-control' required></div>
                         <div class='form-group'><label>% Descuento</label><input type='number' name='discount_pct' class='form-control' required></div>
                         <div class='form-group'><label>Expira</label><input type='date' name='expires_at' class='form-control' required></div>
                         <div class='form-group'><label><input type='checkbox' name='is_active'> Activo</label></div>`
        });
    }
}