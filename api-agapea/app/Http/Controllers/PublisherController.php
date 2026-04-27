<?php

namespace App\Http\Controllers;

use App\Models\Publisher;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class PublisherController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Publisher::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = Publisher::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Publisher::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Publisher::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Publisher::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}