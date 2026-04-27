import { BaseService } from './BaseService.js';

export class CustomerService extends BaseService {
    constructor() {
        super('/customers');
    }
}