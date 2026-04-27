import { BaseCrudComponent } from './BaseCrudComponent.js';
import { OrderService } from '../services/OrderService.js';
import { UiStore } from '../core/UiStore.js';

export class OrderComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new OrderService(),
            title: 'Pedidos',
            columns: [
                { key: 'id', label: 'Pedido #', sortable: true },
                { key: 'customer_id', label: 'Cliente ID', sortable: true },
                { key: 'total', label: 'Total €', sortable: true },
                { key: 'status', label: 'Estado', render: (o) => `<span class="badge badge-${o.status}">${o.status}</span>` },
                { key: 'created_at', label: 'Fecha' }
            ],
            formFields: `` // Overridden locally
        });
    }

    async openForm(id = null) {
        if (!id) {
            UiStore.toast('Los pedidos solo se pueden editar por ahora', 'warning');
            return;
        }

        const panel = document.getElementById('form-panel');
        document.getElementById('form-title').textContent = `Pedido #${id}`;
        document.getElementById('entity-id').value = id;
        
        try {
            // Because our generic OrderController uses Model::findOrFail($id) but doesn't eager load items.
            // Ideally we'd configure the API to load it. But we can query it or if it doesn't have it we do a fallback.
            // Assuming the basic Laravel configuration we wrote returns order directly. 
            // In a real app we would call orderItem service too, or modify OrderController.
            // Let's modify OrderController via JS if necessary, or just load items via OrderItemService filtered by order_id.
            
            const [orderRes, itemsRes] = await Promise.all([
                this.service.getById(id),
                import('../app.js').then(({api}) => api.get(`/order_items?search=${id}`)) // Dummy search trigger or implement filter in API
            ]);
            
            const o = orderRes.data;

            const html = `
                <div class="row">
                    <p><strong>Cliente ID:</strong> ${o.customer_id}</p>
                    <p><strong>Total:</strong> ${o.total} €</p>
                    <p><strong>Descuento:</strong> ${o.discount_amount} €</p>
                    <p><strong>Envío:</strong> ${o.shipping_cost} €</p>
                </div>

                <div class="form-group mt-4">
                    <label>Estado del pedido</label>
                    <select name="status" class="form-control">
                        <option value="pending" ${o.status === 'pending' ? 'selected' : ''}>Pendiente</option>
                        <option value="processing" ${o.status === 'processing' ? 'selected' : ''}>Procesando</option>
                        <option value="shipped" ${o.status === 'shipped' ? 'selected' : ''}>Enviado</option>
                        <option value="delivered" ${o.status === 'delivered' ? 'selected' : ''}>Entregado</option>
                        <option value="cancelled" ${o.status === 'cancelled' ? 'selected' : ''}>Cancelado</option>
                    </select>
                </div>
                
                <h4 style="margin-top:20px;">Líneas del pedido</h4>
                <div style="background:#f9f9f9; padding: 10px; border-radius:4px; font-size:0.9rem;">
                    (Nota: Implementar endpoint específico para traer los /orders/id/items con relaciones de libros si tu backend lo exige)
                </div>
            `;
            
            document.getElementById('form-fields-container').innerHTML = html;
            panel.style.display = 'flex';
        } catch (e) {
            UiStore.toast('Error cargando pedido', 'error');
        }
    }
}
