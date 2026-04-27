<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class FavoriteController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Favorite::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = Favorite::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Favorite::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Favorite::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Favorite::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}