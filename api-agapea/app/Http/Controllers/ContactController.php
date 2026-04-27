<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ContactMessage;

class ContactController extends Controller
{
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'subject' => 'required|string|max:255',
            'message' => 'required|string'
        ]);

        $contact = ContactMessage::create($validatedData);

        return response()->json([
            'message' => 'Mensaje enviado correctamente',
            'data' => $contact
        ], 201);
    }

    public function index(Request $request)
    {
        $perPage = $request->get('per_page', 10);
        return response()->json(ContactMessage::orderBy('created_at', 'desc')->paginate($perPage));
    }

    public function show($id)
    {
        return response()->json(ContactMessage::findOrFail($id));
    }

    public function destroy($id)
    {
        ContactMessage::findOrFail($id)->delete();
        return response()->json(null, 204);
    }
}
