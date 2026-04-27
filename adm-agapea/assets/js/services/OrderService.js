import { BaseService } from './BaseService.js';

export class OrderService extends BaseService {
    constructor() {
        super('/orders');
    }
}