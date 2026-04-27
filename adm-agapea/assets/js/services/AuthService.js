import { api } from '../app.js';

export class AuthService {
    static async login(email, password) {
        const response = await api.post('/admin/login', { email, password });
        if (response.data && response.data.token) {
            localStorage.setItem('agapea_admin_token', response.data.token);
            localStorage.setItem('agapea_admin_user', JSON.stringify(response.data.admin));
            return true;
        }
        return false;
    }

    static logout() {
        localStorage.removeItem('agapea_admin_token');
        localStorage.removeItem('agapea_admin_user');
        window.location.hash = '#login';
    }

    static getUser() {
        const user = localStorage.getItem('agapea_admin_user');
        return user ? JSON.parse(user) : null;
    }
}
