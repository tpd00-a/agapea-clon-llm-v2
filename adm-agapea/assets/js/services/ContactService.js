import { BaseService } from './BaseService.js';

export class ContactService extends BaseService {
    constructor() {
        super('/contacts');
    }
}
