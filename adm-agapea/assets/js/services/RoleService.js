import { BaseService } from './BaseService.js';

export class RoleService extends BaseService {
    constructor() {
        super('/roles');
    }
}