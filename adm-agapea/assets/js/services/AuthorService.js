import { BaseService } from './BaseService.js';

export class AuthorService extends BaseService {
    constructor() {
        super('/authors');
    }
}