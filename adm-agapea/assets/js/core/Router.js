export class Router {
    constructor(routes, containerId) {
        this.routes = routes;
        this.container = document.getElementById(containerId);
        window.addEventListener('hashchange', () => this.handleRoute());
    }

    handleRoute() {
        let hash = window.location.hash.substring(1) || 'dashboard';
        const token = localStorage.getItem('agapea_admin_token');

        if (!token && hash !== 'login') {
            window.location.hash = '#login';
            return;
        }

        if (token && hash === 'login') {
            window.location.hash = '#dashboard';
            return;
        }

        let route = this.routes[hash];
        if (!route) {
            route = this.routes['dashboard'];
        }

        this.renderComponent(route.component);
    }

    async renderComponent(ComponentClass) {
        this.container.innerHTML = '<div class="loader">Cargando...</div>';
        try {
            const component = new ComponentClass();
            await component.render(this.container);
        } catch (error) {
            this.container.innerHTML = `<div class="error">Error cargando vista: ${error.message}</div>`;
        }
    }
}
