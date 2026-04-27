<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class CouponController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Coupon::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = Coupon::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Coupon::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Coupon::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Coupon::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}