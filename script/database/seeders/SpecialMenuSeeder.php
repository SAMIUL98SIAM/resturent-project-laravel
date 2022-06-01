<?php

namespace Database\Seeders;

use App\Models\Food\SpecialMenu;
use Illuminate\Database\Seeder;

class SpecialMenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        SpecialMenu::updateOrCreate(['name' => 'Drinks', 'slug' => 'drinks']);

        SpecialMenu::updateOrCreate(['name' => 'Lunch', 'slug' => 'lunch']);

        SpecialMenu::updateOrCreate(['name' => 'Dinner', 'slug' => 'dinner']);
    }
}
