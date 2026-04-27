<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class CategoryController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Category::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = Category::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Category::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Category::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Category::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}