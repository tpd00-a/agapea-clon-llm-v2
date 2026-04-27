export class BaseLayout {
    static render(contentHtml) {
        const user = JSON.parse(localStorage.getItem('agapea_admin_user') || '{}');
        
        return `
            <div class="app-wrapper">
                <aside class="sidebar">
                    <div class="sidebar-header">
                        Agapea
                    </div>
                    <ul class="sidebar-nav">
                        <li><a href="#dashboard" class="nav-link"><i class="fas fa-home"></i> Dashboard</a></li>
                        <li><a href="#books" class="nav-link"><i class="fas fa-book"></i> Libros</a></li>
                        <li><a href="#orders" class="nav-link"><i class="fas fa-shopping-cart"></i> Pedidos</a></li>
                        <li><a href="#categories" class="nav-link"><i class="fas fa-tags"></i> Categorías</a></li>
                        <li><a href="#authors" class="nav-link"><i class="fas fa-pen-nib"></i> Autores</a></li>
                        <li><a href="#publishers" class="nav-link"><i class="fas fa-building"></i> Editoriales</a></li>
                        <li><a href="#tags" class="nav-link"><i class="fas fa-hashtag"></i> Etiquetas</a></li>
                        <li><a href="#customers" class="nav-link"><i class="fas fa-users"></i> Clientes</a></li>
                        <li><a href="#contacts" class="nav-link"><i class="fas fa-envelope"></i> Contactos</a></li>
                        <li><a href="#coupons" class="nav-link"><i class="fas fa-ticket-alt"></i> Cupones</a></li>
                        <li><a href="#reviews" class="nav-link"><i class="fas fa-star"></i> Reseñas</a></li>
                    </ul>
                </aside>
                
                <main class="main-wrapper">
                    <header class="topbar">
                        <div class="topbar-left">
                            <button id="toggle-sidebar" class="btn btn-secondary"><i class="fas fa-bars"></i></button>
                        </div>
                        <div class="topbar-right">
                            <span class="user-info"><i class="fas fa-user-circle"></i> ${user.name || 'Admin'}</span>
                            <button id="logout-btn" class="btn btn-danger"><i class="fas fa-sign-out-alt"></i></button>
                        </div>
                    </header>
                    <div class="content-area">
                        ${contentHtml}
                    </div>
                </main>
            </div>
        `;
    }

    static attachEvents() {
        // Active link
        const hash = window.location.hash || '#dashboard';
        document.querySelectorAll('.sidebar-nav a').forEach(a => {
            if (a.getAttribute('href') === hash) {
                a.classList.add('active');
            } else {
                a.classList.remove('active');
            }
        });

        // Sidebar toggle for mobile
        document.getElementById('toggle-sidebar')?.addEventListener('click', () => {
            document.querySelector('.sidebar').classList.toggle('open');
        });

        // Logout
        document.getElementById('logout-btn')?.addEventListener('click', () => {
            import('../services/AuthService.js').then(({AuthService}) => {
                AuthService.logout();
            });
        });
    }
}
