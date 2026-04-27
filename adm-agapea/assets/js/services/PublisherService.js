import { BaseService } from './BaseService.js';

export class PublisherService extends BaseService {
    constructor() {
        super('/publishers');
    }
}