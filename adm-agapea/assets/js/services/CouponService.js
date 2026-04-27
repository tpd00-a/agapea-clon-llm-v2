import { BaseService } from './BaseService.js';

export class CouponService extends BaseService {
    constructor() {
        super('/coupons');
    }
}