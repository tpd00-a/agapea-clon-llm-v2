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
                
                <div class="card mt-4">
                    <h3>Estadísticas (Pedidos vs Ingresos)</h3>
                    <div class="chart-container mt-3">
                        <canvas id="dashboardChart" height="120"></canvas>
                    </div>
                </div>
            `;

            container.innerHTML = BaseLayout.render(html);
            BaseLayout.attachEvents();

            // Inicializar gráfico mixto (bar + line) usando Chart.js
            try {
                // destruir gráfico previo si existe
                if (window.dashboardChart instanceof Chart) {
                    window.dashboardChart.destroy();
                }

                const ctx = container.querySelector('#dashboardChart').getContext('2d');

                // etiquetas: últimos 6 meses
                const labels = [];
                for (let i = 5; i >= 0; i--) {
                    const d = new Date();
                    d.setMonth(d.getMonth() - i);
                    labels.push(d.toLocaleString('default', { month: 'short' }));
                }

                // datos: solo tenemos el mes actual desde la API; rellenamos con ceros y ponemos el valor actual en el último índice
                const ordersData = labels.map(() => 0);
                const revenueData = labels.map(() => 0);
                ordersData[ordersData.length - 1] = Number(data.orders_this_month) || 0;
                revenueData[revenueData.length - 1] = Number(data.revenue_this_month) || 0;

                window.dashboardChart = new Chart(ctx, {
                    data: {
                        labels,
                        datasets: [
                            {
                                type: 'bar',
                                label: 'Pedidos',
                                data: ordersData,
                                backgroundColor: 'rgba(25, 54, 131, 0.8)'
                            },
                            {
                                type: 'line',
                                label: 'Ingresos (€)',
                                data: revenueData,
                                borderColor: 'rgba(220, 53, 69, 0.9)',
                                backgroundColor: 'rgba(220, 53, 69, 0.2)',
                                tension: 0.3,
                                yAxisID: 'y1'
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        interaction: { mode: 'index', intersect: false },
                        scales: {
                            y: {
                                beginAtZero: true,
                                position: 'left',
                                title: { display: true, text: 'Pedidos' }
                            },
                            y1: {
                                beginAtZero: true,
                                position: 'right',
                                grid: { drawOnChartArea: false },
                                title: { display: true, text: 'Ingresos (€)' }
                            }
                        }
                    }
                });
            } catch (err) {
                // Fallo silencioso: mostrar toast
                UiStore.toast('Error al inicializar gráfico: ' + err.message, 'error');
            }
        } catch (error) {
            UiStore.toast(error.message, 'error');
            container.innerHTML = BaseLayout.render(`<div class="error">Error cargando dashboard</div>`);
        }
    }
}
