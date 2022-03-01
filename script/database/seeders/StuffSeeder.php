<?php

namespace Database\Seeders;

use App\Models\Stuff;
use App\Models\StuffPosition;
use Illuminate\Database\Seeder;

class StuffSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $headStuff = StuffPosition::where('sp_name','head-shafe')->first();
        Stuff::updateOrCreate([
            'name' => 'Williamson',
            'image'=>'#',
            'facebook_link'=>'#',
            'google_link'=>'#',
            'facebook_link'=>'#',
            'instagram_link'=>'#',
            'linkedin_link'=>'#',
            'stuff_position_id'=> $headStuff->id
        ]);


        $stuff = StuffPosition::where('sp_name','shafe')->first();
        Stuff::updateOrCreate([
            'name' => 'Kristiana',
            'image'=>'#',
            'facebook_link'=>'#',
            'google_link'=>'#',
            'facebook_link'=>'#',
            'instagram_link'=>'#',
            'linkedin_link'=>'#',
            'stuff_position_id'=> $stuff->id
        ]);

        $f_stuff = StuffPosition::where('sp_name','foreign-shafe')->first();
        Stuff::updateOrCreate([
            'name' => 'Steve Thomas',
            'image'=>'#',
            'facebook_link'=>'#',
            'google_link'=>'#',
            'facebook_link'=>'#',
            'instagram_link'=>'#',
            'linkedin_link'=>'#',
            'stuff_position_id'=> $f_stuff->id
        ]);
    }
}
