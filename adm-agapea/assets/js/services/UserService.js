import { BaseService } from './BaseService.js';

export class UserService extends BaseService {
    constructor() {
        super('/users');
    }
}