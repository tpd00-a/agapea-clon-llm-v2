<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\{
    AuthController, RoleController, UserController, CategoryController, AuthorController,
    PublisherController, BookController, TagController, CustomerController, OrderController,
    OrderItemController, FavoriteController, ReviewController, CouponController
};

Route::prefix('v1')->group(function () {
    // Auth Routes
    Route::post('auth/register', [AuthController::class, 'registerCustomer']);
    Route::post('auth/login', [AuthController::class, 'loginCustomer']);
    Route::middleware('auth:sanctum')->get('auth/me', [AuthController::class, 'meCustomer']);

    Route::post('admin/login', [AuthController::class, 'loginAdmin']);

    // Public Books and Public READ endpoints
    Route::apiResource('books', BookController::class)->only(['index', 'show']);
    Route::get('books/{id}/related', [BookController::class, 'related']);
    Route::get('books/{id}/reviews', [BookController::class, 'reviews']);

    // Other public reads if necessary (usually categories, authors are also public read)
    Route::apiResource('categories', CategoryController::class)->only(['index', 'show']);
    Route::apiResource('authors', AuthorController::class)->only(['index', 'show']);
    Route::apiResource('publishers', PublisherController::class)->only(['index', 'show']);
    Route::apiResource('tags', TagController::class)->only(['index', 'show']);
    
    // Contacto público
    Route::post('contacts', [\App\Http\Controllers\ContactController::class, 'store']);

    // Protected Routes
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('dashboard', [\App\Http\Controllers\DashboardController::class, 'index']);
        Route::apiResource('books', BookController::class)->except(['index', 'show']);
        Route::apiResource('categories', CategoryController::class)->except(['index', 'show']);
        Route::apiResource('authors', AuthorController::class)->except(['index', 'show']);
        Route::apiResource('publishers', PublisherController::class)->except(['index', 'show']);
        Route::apiResource('tags', TagController::class)->except(['index', 'show']);
        
        Route::apiResource('roles', RoleController::class);
        Route::apiResource('users', UserController::class);
        Route::apiResource('customers', CustomerController::class);
        Route::apiResource('coupons', CouponController::class);
        Route::apiResource('contacts', \App\Http\Controllers\ContactController::class)->except(['store']);
        
        // Orders, Favorites, Reviews (protected creates/edits)
        Route::apiResource('orders', OrderController::class);
        Route::apiResource('order_items', OrderItemController::class);
        Route::apiResource('favorites', FavoriteController::class);
        Route::apiResource('reviews', ReviewController::class);

        // Cart & Checkout
        Route::get('cart', [\App\Http\Controllers\CartController::class, 'get']);
        Route::post('cart/sync', [\App\Http\Controllers\CartController::class, 'sync']);
        Route::post('checkout', [\App\Http\Controllers\CheckoutController::class, 'checkout']);
    });
});
