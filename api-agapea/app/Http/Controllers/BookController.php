<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class BookController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $query = Book::with(['author', 'category', 'publisher', 'tags']);

        if ($request->has('category')) {
            $query->whereHas('category', function ($q) use ($request) {
                $q->where('slug', $request->category)
                  ->orWhere('id', $request->category);
            });
        }

        if ($request->has('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('title', 'LIKE', "%{$search}%")
                  ->orWhere('isbn', 'LIKE', "%{$search}%")
                  ->orWhereHas('author', function ($qa) use ($search) {
                      $qa->where('name', 'LIKE', "%{$search}%");
                  });
            });
        }

        if ($request->has('sort')) {
            switch ($request->sort) {
                case 'price_asc':
                    $query->orderBy('price', 'asc');
                    break;
                case 'price_desc':
                    $query->orderBy('price', 'desc');
                    break;
                case 'newest':
                    $query->orderBy('created_at', 'desc');
                    break;
                default:
                    $query->orderBy('id', 'desc');
                    break;
            }
        } else {
            $query->orderBy('id', 'desc');
        }

        $books = $query->paginate($request->get('per_page', 10));

        return $this->respondWithCollection($books);
    }

    public function store(Request $request)
    {
        $book = Book::create($request->all());
        return $this->respondWithItem($book, 201);
    }

    public function show($id)
    {
        $book = Book::with(['author', 'category', 'publisher', 'tags'])->findOrFail($id);
        return $this->respondWithItem($book);
    }

    public function update(Request $request, $id)
    {
        $book = Book::findOrFail($id);
        $book->update($request->all());
        return $this->respondWithItem($book);
    }

    public function destroy($id)
    {
        $book = Book::findOrFail($id);
        $book->delete();
        return response()->json(null, 204);
    }

    public function related($id)
    {
        $book = Book::findOrFail($id);
        
        $related = Book::where('category_id', $book->category_id)
            ->where('id', '!=', $book->id)
            ->limit(4)
            ->get();
            
        return $this->respondWithItem($related);
    }

    public function reviews($id)
    {
        $book = Book::findOrFail($id);
        $reviews = $book->reviews()->with('customer:id,first_name,last_name')->get();
        return $this->respondWithItem($reviews);
    }
}
