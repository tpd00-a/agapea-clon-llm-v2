<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CartController extends Controller
{
    public function get(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Return empty array if no cart_data saved
        $cartData = $user->cart_data;
        $decoded = is_string($cartData) ? json_decode($cartData, true) : $cartData;

        return response()->json(['data' => $decoded ?: []]);
    }

    public function sync(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $request->validate([
            'items' => 'present|array'
        ]);

        $user->cart_data = $request->input('items');
        $user->save();

        return response()->json(['message' => 'Cart synchronized']);
    }
}
