<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Pagination\LengthAwarePaginator;

trait ApiResponseTrait
{
    protected function respondWithItem($data, $statusCode = 200): JsonResponse
    {
        return response()->json([
            'data' => $data
        ], $statusCode);
    }

    protected function respondWithCollection(LengthAwarePaginator $collection, $statusCode = 200): JsonResponse
    {
        return response()->json([
            'data' => $collection->items(),
            'meta' => [
                'total' => $collection->total(),
                'page' => $collection->currentPage(),
                'per_page' => $collection->perPage(),
            ]
        ], $statusCode);
    }
}
