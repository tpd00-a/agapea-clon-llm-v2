<?php

namespace App\Http\Controllers;

use App\Models\OrderItem;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class OrderItemController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(OrderItem::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = OrderItem::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(OrderItem::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = OrderItem::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (OrderItem::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}