import { BaseService } from './BaseService.js';

export class ReviewService extends BaseService {
    constructor() {
        super('/reviews');
    }
}