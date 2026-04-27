import { api } from '../app.js';

export class BaseService {
    constructor(endpoint) {
        this.endpoint = endpoint;
    }

    async getAll(page = 1, perPage = 10, search = '', sort = '') {
        const query = new URLSearchParams();
        query.append('page', page);
        query.append('per_page', perPage);
        if (search) query.append('search', search);
        if (sort) query.append('sort', sort);

        return api.get(`${this.endpoint}?${query.toString()}`);
    }

    async getById(id) {
        return api.get(`${this.endpoint}/${id}`);
    }

    async create(data) {
        return api.post(this.endpoint, data);
    }

    async update(id, data) {
        // En Laravel para actualizar vía FormData con Base64, etc. a veces conviene enviar un POST con _method=PUT o enviar JSON
        // Asumiremos JSON por defecto o formData normal
        if (data instanceof FormData) {
            data.append('_method', 'PUT');
            return api.post(`${this.endpoint}/${id}`, data);
        }
        return api.put(`${this.endpoint}/${id}`, data);
    }

    async destroy(id) {
        return api.delete(`${this.endpoint}/${id}`);
    }
}
