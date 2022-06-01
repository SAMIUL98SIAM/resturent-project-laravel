<?php

namespace Database\Seeders;

use App\Models\Food\SpecialItem;
use Illuminate\Database\Seeder;

class SpecialItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        SpecialItem::updateOrCreate(['name' => 'Sepcial Drinks 1', 'slug' => 'sepcial-drinks-1']);
        SpecialItem::updateOrCreate(['name' => 'Sepcial Drinks 2', 'slug' => 'sepcial-drinks-2']);
        SpecialItem::updateOrCreate(['name' => 'Sepcial Drinks 3', 'slug' => 'sepcial-drinks-3']);

        SpecialItem::updateOrCreate(['name' => 'Sepcial Lunch 1', 'slug' => 'sepcial-lunch-1']);
        SpecialItem::updateOrCreate(['name' => 'Sepcial Lunch 2', 'slug' => 'sepcial-lunch-2']);
        SpecialItem::updateOrCreate(['name' => 'Sepcial Lunch 3', 'slug' => 'sepcial-lunch-3']);

        SpecialItem::updateOrCreate(['name' => 'Sepcial Diner 1', 'slug' => 'sepcial-diner-1']);
        SpecialItem::updateOrCreate(['name' => 'Sepcial Diner 2', 'slug' => 'sepcial-diner-2']);
        SpecialItem::updateOrCreate(['name' => 'Sepcial Diner 3', 'slug' => 'sepcial-diner-3']);

    }
}
