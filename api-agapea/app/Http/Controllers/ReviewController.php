<?php

namespace App\Http\Controllers;

use App\Models\Review;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class ReviewController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Review::paginate($perPage));
    }

    public function store(Request $request)
    {
        $request->validate([
            'book_id' => 'required|exists:books,id',
            'rating' => 'required|integer|min:1|max:5',
            'comment' => 'required|string'
        ]);

        $data = $request->all();
        $data['customer_id'] = $request->user()->id;

        $item = Review::create($data);
        return $this->respondWithItem($item->load('customer:id,first_name,last_name'), 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Review::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Review::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Review::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}