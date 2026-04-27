import { DashboardService } from '../services/DashboardService.js';
import { BaseLayout } from './BaseLayout.js';
import { UiStore } from '../core/UiStore.js';

export class DashboardComponent {
    async render(container) {
        try {
            const stats = await DashboardService.getStats();
            const data = stats.data;

            const html = `
                <h2>Dashboard</h2>
                <div class="dashboard-grid mt-4">
                    <div class="stat-card">
                        <h3>Libros Totales</h3>
                        <div class="value">${data.total_books}</div>
                    </div>
                    <div class="stat-card">
                        <h3>Pedidos (Mes)</h3>
                        <div class="value">${data.orders_this_month}</div>
                    </div>
                    <div class="stat-card">
                        <h3>Ingresos (Mes)</h3>
                        <div class="value">${data.revenue_this_month} €</div>
                    </div>
                </div>

                <div class="card mt-4">
                    <h3>Últimos Pedidos</h3>
                    <div class="table-responsive mt-3">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Cliente</th>
                                    <th>Estado</th>
                                    <th>Total</th>
                                    <th>Fecha</th>
                                </tr>
                            </thead>
                            <tbody>
                                ${data.latest_orders.map(o => `
                                    <tr>
                                        <td>#${o.id}</td>
                                        <td>${o.customer.first_name} ${o.customer.last_name}</td>
                                        <td><span class="badge badge-${o.status}">${o.status}</span></td>
                                        <td>${o.total} €</td>
                                        <td>${new Date(o.created_at).toLocaleDateString()}</td>
                                    </tr>
                                `).join('')}
                            </tbody>
                        </table>
                        ${data.latest_orders.length === 0 ? '<p>No hay pedidos recientes</p>' : ''}
                    </div>
                </div>
            `;

            container.innerHTML = BaseLayout.render(html);
            BaseLayout.attachEvents();
        } catch (error) {
            UiStore.toast(error.message, 'error');
            container.innerHTML = BaseLayout.render(`<div class="error">Error cargando dashboard</div>`);
        }
    }
}
