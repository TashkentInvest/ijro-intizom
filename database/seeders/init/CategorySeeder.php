<?php

namespace Database\Seeders\init;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [
            ['name' => 'HR'],
            ['name' => 'Shaxsiy'],
            ['name' => 'Uchrashuv'],
        ];

        foreach ($categories as $categoryData) {
            Category::create($categoryData);
        }
    }
}
