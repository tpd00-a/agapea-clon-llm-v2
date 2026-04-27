import { Router } from './core/Router.js';
import { ApiClient } from './core/ApiClient.js';
import { UiStore } from './core/UiStore.js';

// Components
import { DashboardComponent } from './components/DashboardComponent.js';
import { LoginComponent } from './components/LoginComponent.js';
import { BookComponent } from './components/BookComponent.js';
import { CategoryComponent } from './components/CategoryComponent.js';
import { AuthorComponent } from './components/AuthorComponent.js';
import { PublisherComponent } from './components/PublisherComponent.js';
import { TagComponent } from './components/TagComponent.js';
import { CustomerComponent } from './components/CustomerComponent.js';
import { CouponComponent } from './components/CouponComponent.js';
import { ContactComponent } from './components/ContactComponent.js';
import { UserComponent } from './components/UserComponent.js';
import { ReviewComponent } from './components/ReviewComponent.js';
import { OrderComponent } from './components/OrderComponent.js';

// Shared instance of ApiClient
export const api = new ApiClient();

// Setup routes
const routes = {
    'login': { component: LoginComponent },
    'dashboard': { component: DashboardComponent },
    'books': { component: BookComponent },
    'orders': { component: OrderComponent },
    'categories': { component: CategoryComponent },
    'authors': { component: AuthorComponent },
    'publishers': { component: PublisherComponent },
    'tags': { component: TagComponent },
    'customers': { component: CustomerComponent },
    'contacts': { component: ContactComponent },
    'coupons': { component: CouponComponent },
    'users': { component: UserComponent },
    'reviews': { component: ReviewComponent }
};

document.addEventListener('DOMContentLoaded', () => {
    window.router = new Router(routes, 'app-container');
    window.router.handleRoute(); // Init
});
