<?php

namespace App\Http\Controllers;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Traits\ApiResponseTrait;

class RoleController extends Controller
{
    use ApiResponseTrait;

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return $this->respondWithCollection(Role::paginate($perPage));
    }

    public function store(Request $request)
    {
        $item = Role::create($request->all());
        return $this->respondWithItem($item, 201);
    }

    public function show($id)
    {
        return $this->respondWithItem(Role::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $item = Role::findOrFail($id);
        $item->update($request->all());
        return $this->respondWithItem($item);
    }

    public function destroy($id)
    {
        (Role::findOrFail($id))->delete();
        return response()->json(null, 204);
    }
}