<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class TagController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Tag::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = Tag::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Tag::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Tag::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Tag::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}