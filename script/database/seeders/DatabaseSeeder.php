<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

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
    }
}
