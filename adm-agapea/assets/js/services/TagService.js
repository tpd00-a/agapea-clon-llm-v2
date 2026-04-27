import { BaseService } from './BaseService.js';

export class TagService extends BaseService {
    constructor() {
        super('/tags');
    }
}