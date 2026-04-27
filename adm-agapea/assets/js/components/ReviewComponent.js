import { BaseCrudComponent } from './BaseCrudComponent.js';
import { ReviewService } from '../services/ReviewService.js';

export class ReviewComponent extends BaseCrudComponent {
    constructor() {
        super({
            service: new ReviewService(),
            title: 'Reseñas',
            columns: [{key:'id',label:'ID'},{key:'book_id',label:'Libro ID'},{key:'rating',label:'Rating'},{key:'comment',label:'Comentario'}],
            formFields: `<div class='form-group'><p>Las reseñas no se editan desde aquí</p></div>`
        });
    }
}