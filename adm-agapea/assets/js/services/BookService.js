import { BaseService } from './BaseService.js';

export class BookService extends BaseService {
    constructor() {
        super('/books');
    }
}