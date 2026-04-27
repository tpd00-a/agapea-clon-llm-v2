<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;
use App\Models\Order;
use App\Traits\ApiResponseTrait;

class DashboardController extends Controller
{
    use ApiResponseTrait;

    public function index()
    {
        $totalBooks = Book::count();
        $thisMonthOrders = Order::whereMonth('created_at', now()->month)
                                ->whereYear('created_at', now()->year);
        
        $ordersCount = $thisMonthOrders->count();
        $revenue = $thisMonthOrders->whereNotIn('status', ['cancelled'])->sum('total');
        
        $latestOrders = Order::with('customer:id,first_name,last_name,email')
                             ->orderBy('created_at', 'desc')
                             ->take(5)
                             ->get();

        return response()->json([
            'data' => [
                'total_books' => $totalBooks,
                'orders_this_month' => $ordersCount,
                'revenue_this_month' => round($revenue, 2),
                'latest_orders' => $latestOrders
            ]
        ]);
    }
}
