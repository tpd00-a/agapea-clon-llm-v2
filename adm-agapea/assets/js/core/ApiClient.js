export class ApiClient {
    constructor() {
        this.baseUrl = 'http://localhost:8000/api/v1';
    }

    getHeaders() {
        const token = localStorage.getItem('agapea_admin_token');
        const headers = {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        };
        if (token) {
            headers['Authorization'] = `Bearer ${token}`;
        }
        return headers;
    }

    async request(endpoint, method = 'GET', body = null) {
        const config = {
            method,
            headers: this.getHeaders(),
        };

        if (body) {
            if (body instanceof FormData) {
                // Let browser set content-type with boundary
                delete config.headers['Content-Type'];
                config.body = body;
            } else {
                config.body = JSON.stringify(body);
            }
        }

        try {
            const response = await fetch(`${this.baseUrl}${endpoint}`, config);
            
            if (response.status === 401) {
                localStorage.removeItem('agapea_admin_token');
                window.location.hash = '#login';
                throw new Error('No autorizado');
            }

            // 204 No Content
            if (response.status === 204) {
                return true;
            }

            const data = await response.json();
            
            if (!response.ok) {
                throw new Error(data.message || 'Error en la petición');
            }

            return data;
        } catch (error) {
            console.error('API Error:', error);
            throw error;
        }
    }

    get(endpoint) { return this.request(endpoint, 'GET'); }
    post(endpoint, body) { return this.request(endpoint, 'POST', body); }
    put(endpoint, body) { return this.request(endpoint, 'PUT', body); }
    delete(endpoint) { return this.request(endpoint, 'DELETE'); }
}
