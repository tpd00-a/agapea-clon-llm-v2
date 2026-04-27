<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\Role;
use App\Models\User;
use App\Models\Category;
use App\Models\Author;
use App\Models\Publisher;
use App\Models\Book;
use App\Models\Tag;
use App\Models\Coupon;
use Faker\Factory as Faker;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create('es_ES');

        // Roles
        $adminRole = Role::create(['name' => 'admin']);
        $editorRole = Role::create(['name' => 'editor']);

        // Admin User
        User::create([
            'name' => 'Administrador Agapea',
            'email' => 'admin@agapea.com',
            'password' => Hash::make('admin123'),
            'role_id' => $adminRole->id,
        ]);

        // Categories
        $categoriesData = ['Literatura', 'Ciencias Humanas', 'Ciencias Técnicas', 'Libros Infantiles', 'Tiempo Libre'];
        $categories = [];
        foreach ($categoriesData as $c) {
            $categories[] = Category::create([
                'name' => $c,
                'slug' => Str::slug($c)
            ]);
        }

        // Publishers
        $publishersData = ['Planeta', 'Salamandra', 'Debolsillo'];
        $publishers = [];
        foreach ($publishersData as $p) {
            $publishers[] = Publisher::create(['name' => $p]);
        }

        // Authors
        $authorsData = [
            'Gabriel García Márquez', 'Isabel Allende', 'Carlos Ruiz Zafón', 'Mario Vargas Llosa', 'Cervantes',
            'J.K. Rowling', 'Stephen King', 'George R.R. Martin', 'Agatha Christie', 'J.R.R. Tolkien',
            'Ken Follett', 'Arturo Pérez-Reverte', 'Laura Gallego', 'Albert Espinosa', 'Javier Castillo'
        ];
        $authors = [];
        foreach ($authorsData as $a) {
            $authors[] = Author::create([
                'name' => $a,
                'bio' => $faker->paragraph(3)
            ]);
        }

        // Tags
        $tagsData = ['Ficción', 'Misterio', 'Historia', 'Fantasía', 'Novela Negra', 'Poesía', 'Romance', 'Desarrollo Personal', 'Cocina', 'Arte'];
        $tags = [];
        foreach ($tagsData as $t) {
            $tags[] = Tag::create(['name' => $t]);
        }

        // Books (60)
        $books = [];
        
        $newBooks = 0;
        $bestSellers = 0;

        for ($i = 0; $i < 60; $i++) {
            $isNew = $faker->boolean(20);
            $isBestseller = $faker->boolean(20);
            
            if ($isNew) $newBooks++;
            if ($isBestseller) $bestSellers++;

            $price = $faker->randomFloat(2, 5, 45);
            $hasDiscount = $faker->boolean(30);
            $discount = $hasDiscount ? $faker->numberBetween(5, 20) : 0;
            $originalPrice = $hasDiscount ? round($price / (1 - ($discount / 100)), 2) : null;

            $book = Book::create([
                'title' => $faker->sentence(mt_rand(2, 6)),
                'isbn' => $faker->isbn13(),
                'author_id' => $faker->randomElement($authors)->id,
                'category_id' => $faker->randomElement($categories)->id,
                'publisher_id' => $faker->randomElement($publishers)->id,
                'price' => $price,
                'original_price' => $originalPrice,
                'discount' => $discount,
                'stock' => $faker->numberBetween(0, 150),
                'description' => $faker->paragraphs(3, true),
                'cover_image' => 'https://via.placeholder.com/300x450.png?text=Libro+' . ($i + 1),
                'pages' => $faker->numberBetween(100, 1000),
                'language' => $faker->randomElement(['Español', 'Español', 'Español', 'Inglés', 'Catalán']),
                'year' => $faker->year(),
                'genre' => $faker->randomElement($tagsData),
                'is_new' => $isNew,
                'is_bestseller' => $isBestseller,
                'is_featured' => $faker->boolean(10)
            ]);

            // Attach 1-3 tags
            $book->tags()->attach($faker->randomElements($tags, mt_rand(1, 3)));
            $books[] = $book;
        }

        // Ensure we hit the constraint of at least 10 new and 10 bestsellers
        for ($i = $newBooks; $i < 10; $i++) {
            $books[$i]->update(['is_new' => true]);
        }
        for ($i = $bestSellers; $i < 10; $i++) {
            $books[count($books)-1-$i]->update(['is_bestseller' => true]);
        }

        // Coupons
        Coupon::create([
            'code' => 'AGAPEA10',
            'discount_pct' => 10,
            'is_active' => true,
            'expires_at' => now()->addMonths(6)
        ]);

        Coupon::create([
            'code' => 'LIBROS5',
            'discount_pct' => 5,
            'is_active' => true,
            'expires_at' => now()->addMonths(3)
        ]);

        Coupon::create([
            'code' => 'VERANO20',
            'discount_pct' => 20,
            'is_active' => true,
            'expires_at' => now()->addMonths(1)
        ]);
    }
}
