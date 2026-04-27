<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Traits\ApiResponseTrait;

class AuthController extends Controller
{
    use ApiResponseTrait;

    public function registerCustomer(Request $request)
    {
        $data = $request->validate([
            'nif' => 'required|string|unique:customers',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|string|email|unique:customers',
            'password' => 'required|string|min:6',
        ]);

        $data['password'] = Hash::make($data['password']);

        $customer = Customer::create($data);
        $token = $customer->createToken('customer-token')->plainTextToken;

        return $this->respondWithItem(['customer' => $customer, 'token' => $token], 201);
    }

    public function loginCustomer(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $customer = Customer::where('email', $request->email)->first();

        if (!$customer || !Hash::check($request->password, $customer->password)) {
            return response()->json(['message' => 'Credenciales inválidas'], 401);
        }

        $token = $customer->createToken('customer-token')->plainTextToken;

        return $this->respondWithItem(['customer' => $customer, 'token' => $token]);
    }

    public function meCustomer(Request $request)
    {
        return $this->respondWithItem($request->user());
    }

    public function loginAdmin(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        $admin = User::where('email', $request->email)->first();

        if (!$admin || !Hash::check($request->password, $admin->password)) {
            return response()->json(['message' => 'Credenciales inválidas'], 401);
        }

        $token = $admin->createToken('admin-token')->plainTextToken;

        return $this->respondWithItem(['admin' => $admin, 'token' => $token]);
    }
}
