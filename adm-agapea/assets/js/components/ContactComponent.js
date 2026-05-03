import { BaseCrudComponent } from './BaseCrudComponent.js';
import { ContactService } from '../services/ContactService.js';

export class ContactComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new ContactService(),
            title: 'Mensajes de Contacto',
            columns: [
                { key: 'id', label: 'ID', sortable: true },
                { key: 'name', label: 'Nombre', sortable: true },
                { key: 'email', label: 'Email' },
                { key: 'subject', label: 'Asunto' },
                { key: 'message', label: 'Mensaje' },
                { key: 'created_at', label: 'Fecha' }
            ],
            formFields: async (id) => `
                <div class="form-group" style="padding:15px; background:#f9f9f9; border:1px solid #ccc; border-radius:8px;">
                    <h4 style="margin-top:0">Detalles del Mensaje</h4>
                    <p><strong>De:</strong> <span id="info-name"></span> (<span id="info-email"></span>)</p>
                    <p><strong>Asunto:</strong> <span id="info-subject"></span></p>
                    <p><strong>Fecha:</strong> <span id="info-date"></span></p>
                    <hr>
                    <p style="white-space: pre-wrap;" id="info-message"></p>
                </div>
            `
        });
    }

    populateForm(data) {
        super.populateForm(data);
        const nameEl = document.getElementById('info-name');
        const emailEl = document.getElementById('info-email');
        const subjectEl = document.getElementById('info-subject');
        const dateEl = document.getElementById('info-date');
        const messageEl = document.getElementById('info-message');

        if(nameEl) nameEl.textContent = data.name || '';
        if(emailEl) emailEl.textContent = data.email || '';
        if(subjectEl) subjectEl.textContent = data.subject || '';
        if(dateEl && data.created_at) dateEl.textContent = new Date(data.created_at).toLocaleString();
        if(messageEl) messageEl.textContent = data.message || '';
    }

    async saveForm(formData) {
        // En los mensajes de contacto no guardamos, es read-only.
        window.app.currentComponent.render();
    }
}
