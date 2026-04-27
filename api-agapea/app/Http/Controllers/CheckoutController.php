<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Book;
use Illuminate\Support\Facades\DB;

class CheckoutController extends Controller
{
    public function checkout(Request $request)
    {
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Recuperar cart items del body o base de datos (cart.js manda payload)
        $items = $request->input('items', []);
        if (empty($items)) {
            return response()->json(['message' => 'El carrito está vacío'], 422);
        }

        DB::beginTransaction();

        try {
            $subtotal = 0;
            $itemsProcessed = [];

            // Verificar stocks y calcular precios on the fly
            foreach ($items as $item) {
                $book = Book::findOrFail($item['id']);
                
                if ($book->stock < $item['cantidad']) {
                    throw new \Exception("Stock insuficiente para el libro: " . $book->title);
                }

                $book->stock -= $item['cantidad'];
                $book->save();

                $lineTotal = $book->price * $item['cantidad'];
                $subtotal += $lineTotal;

                $itemsProcessed[] = [
                    'book_id' => $book->id,
                    'quantity' => $item['cantidad'],
                    'unit_price' => $book->price,
                ];
            }

            // Gastos envío y cupones simulados
            $shipping_cost = $subtotal >= 19 ? 0 : 3.99;
            $discount_amount = 0;
            $couponCode = $request->input('coupon_code', '');

            if ($couponCode === 'AGAPEA10') {
               $discount_amount = ($subtotal + $shipping_cost) * 0.10;
            } elseif ($couponCode === 'LIBROS5') {
               $discount_amount = ($subtotal + $shipping_cost) * 0.05;
            }

            $total = ($subtotal + $shipping_cost) - $discount_amount;

            $order = Order::create([
                'customer_id' => $user->id,
                'status' => 'pending',
                'subtotal' => $subtotal,
                'shipping_cost' => $shipping_cost,
                'discount_amount' => $discount_amount,
                'total' => $total,
                'coupon_code' => $couponCode ?: null,
            ]);

            foreach ($itemsProcessed as $data) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'book_id' => $data['book_id'],
                    'quantity' => $data['quantity'],
                    'unit_price' => $data['unit_price']
                ]);
            }

            // Limpiar carrito temporalmente en customer
            $user->cart_data = null;
            $user->save();

            DB::commit();

            return response()->json([
                'message' => 'Compra realizada con éxito',
                'order' => $order->load('items')
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => $e->getMessage()], 422);
        }
    }
}
