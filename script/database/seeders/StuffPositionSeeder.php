<?php

namespace Database\Seeders;

use App\Models\StuffPosition;
use Illuminate\Database\Seeder;

class StuffPositionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        StuffPosition::updateOrCreate(['sp_name' => 'head-shafe']);
        StuffPosition::updateOrCreate(['sp_name' => 'foreign-shafe']);
        StuffPosition::updateOrCreate(['sp_name' => 'shafe']);
    }
}
