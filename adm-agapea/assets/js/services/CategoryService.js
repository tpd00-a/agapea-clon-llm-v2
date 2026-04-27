import { BaseService } from './BaseService.js';

export class CategoryService extends BaseService {
    constructor() {
        super('/categories');
    }
}