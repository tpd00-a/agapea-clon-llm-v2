import { api } from '../app.js';

export class DashboardService {
    static async getStats() {
        return api.get('/dashboard');
    }
}
