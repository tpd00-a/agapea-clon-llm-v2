import { AuthService } from '../services/AuthService.js';
import { UiStore } from '../core/UiStore.js';

export class LoginComponent {
    async render(container) {
        container.innerHTML = `
            <div class="login-container">
                <div class="card" style="width: 100%; max-width: 400px;">
                    <h2 style="text-align:center; color: var(--primary-color); margin-bottom: 20px;">Agapea Admin</h2>
                    <form id="login-form">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" id="email" class="form-control" required placeholder="admin@agapea.com">
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" id="password" class="form-control" required placeholder="admin123">
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 100%; justify-content:center;">Entrar</button>
                    </form>
                </div>
            </div>
        `;

        document.getElementById('login-form').addEventListener('submit', async (e) => {
            e.preventDefault();
            const btn = e.target.querySelector('button');
            btn.disabled = true;
            btn.innerHTML = 'Cargando...';

            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            try {
                const ok = await AuthService.login(email, password);
                if (ok) {
                    UiStore.toast('Login exitoso');
                    window.location.hash = '#dashboard';
                }
            } catch (err) {
                UiStore.toast(err.message, 'error');
                btn.disabled = false;
                btn.innerHTML = 'Entrar';
            }
        });
    }
}
