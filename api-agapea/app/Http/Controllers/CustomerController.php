<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class CustomerController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Customer::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = Customer::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Customer::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Customer::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Customer::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}