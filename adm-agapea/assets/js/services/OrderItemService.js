import { BaseService } from './BaseService.js';

export class OrderItemService extends BaseService {
    constructor() {
        super('/order_items');
    }
}