<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    use HasFactory;

    protected $fillable = [
        'title', 'isbn', 'author_id', 'category_id', 'publisher_id',
        'price', 'original_price', 'discount', 'stock', 'description',
        'cover_image', 'pages', 'language', 'year', 'genre',
        'is_new', 'is_bestseller', 'is_featured'
    ];

    protected $casts = [
        'is_new' => 'boolean',
        'is_bestseller' => 'boolean',
        'is_featured' => 'boolean',
    ];

    public function author()
    {
        return $this->belongsTo(Author::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }
}
