<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\Post;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(PermissionSeeder::class);
        $this->call(RoleSeeder::class);
        $this->call(UserSeeder::class);
        $this->call(MenuSeeder::class);
        $this->call(StuffPositionSeeder::class);
        $this->call(StuffSeeder::class);
        $this->call(SpecialMenuSeeder::class);
        $this->call(SpecialItemSeeder::class);
        $this->call(TagSeeder::class);

        Category::factory()->count(5)->create();
        Post::factory()->count(45)->create();
    }
}
