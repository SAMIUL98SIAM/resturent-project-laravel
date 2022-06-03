<?php

namespace Database\Seeders;

use App\Models\Module;
use App\Models\Permission;
use Illuminate\Database\Seeder;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $moduleAppDashboard = Module::updateOrCreate(['name'=>'Admin Dashboard']);

        Permission::updateOrCreate([
            'module_id' => $moduleAppDashboard->id ,
            'name' => 'Access Dashboard' ,
            'slug' => 'admin.dashboard'
        ]);


        //Roles
        $moduleAppRole = Module::updateOrCreate(['name' => 'Role Management']);
        Permission::updateOrCreate([
            'module_id' => $moduleAppRole->id ,
            'name' => 'Access Role' ,
            'slug' => 'admin.roles.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppRole->id ,
            'name' => 'Create Role' ,
            'slug' => 'admin.roles.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppRole->id ,
            'name' => 'Edit Role' ,
            'slug' => 'admin.roles.edit'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppRole->id ,
            'name' => 'Delete Role' ,
            'slug' => 'admin.roles.destroy'
        ]);



        //Backups
        $moduleAppBackups = Module::updateOrCreate(['name' => 'Backups']);
        Permission::updateOrCreate([
            'module_id' => $moduleAppBackups->id ,
            'name' => 'Access Backup' ,
            'slug' => 'admin.backups.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppBackups->id ,
            'name' => 'Create Backup' ,
            'slug' => 'admin.backups.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppBackups->id ,
            'name' => 'Download Backup' ,
            'slug' => 'admin.backups.download'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppBackups->id ,
            'name' => 'Delete Backup' ,
            'slug' => 'admin.backups.destroy'
        ]);



        //Users
        $moduleAppUser = Module::updateOrCreate(['name' => 'User Management']);
        Permission::updateOrCreate([
            'module_id' => $moduleAppUser->id ,
            'name' => 'Access User' ,
            'slug' => 'admin.users.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppUser->id ,
            'name' => 'Create User' ,
            'slug' => 'admin.users.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppUser->id ,
            'name' => 'Edit User' ,
            'slug' => 'admin.users.edit'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppUser->id ,
            'name' => 'Delete User' ,
            'slug' => 'admin.users.destroy'
        ]);



        //Logo
        $moduleAppLogo = Module::updateOrCreate(['name' => 'Logo Management']);
        Permission::updateOrCreate([
            'module_id' => $moduleAppLogo->id ,
            'name' => 'Access Logo' ,
            'slug' => 'admin.logos.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppLogo->id ,
            'name' => 'Create Logo' ,
            'slug' => 'admin.logos.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppLogo->id ,
            'name' => 'Edit Logo' ,
            'slug' => 'admin.logos.edit'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppLogo->id ,
            'name' => 'Delete Logo' ,
            'slug' => 'admin.logos.destroy'
        ]);


        //Slider
        $moduleAppSlider = Module::updateOrCreate(['name' => 'Slider Management']);
        Permission::updateOrCreate([
            'module_id' => $moduleAppSlider->id ,
            'name' => 'Access Slider' ,
            'slug' => 'admin.sliders.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppSlider->id ,
            'name' => 'Create Slider' ,
            'slug' => 'admin.sliders.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppSlider->id ,
            'name' => 'Edit Slider' ,
            'slug' => 'admin.sliders.edit'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppSlider->id ,
            'name' => 'Delete Slider' ,
            'slug' => 'admin.sliders.destroy'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppSlider->id ,
            'name' => 'Unactivate Slider' ,
            'slug' => 'admin.sliders.unactivate'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppSlider->id ,
            'name' => 'Activate Slider' ,
            'slug' => 'admin.sliders.activate'
        ]);


       //Gallery
       $moduleAppGallery = Module::updateOrCreate(['name' => 'Gallery Management']);
       Permission::updateOrCreate([
           'module_id' => $moduleAppGallery->id ,
           'name' => 'Access Gallery' ,
           'slug' => 'admin.galleries.index'
       ]);

       Permission::updateOrCreate([
           'module_id' => $moduleAppGallery->id ,
           'name' => 'Create Gallery' ,
           'slug' => 'admin.galleries.create'
       ]);

       Permission::updateOrCreate([
           'module_id' => $moduleAppGallery->id ,
           'name' => 'Edit Gallery' ,
           'slug' => 'admin.galleries.edit'
       ]);

       Permission::updateOrCreate([
           'module_id' => $moduleAppGallery->id ,
           'name' => 'Delete Gallery' ,
           'slug' => 'admin.galleries.destroy'
       ]);



       //Stuff
       $moduleAppStuff = Module::updateOrCreate(['name' => 'Stuff Management']);
       Permission::updateOrCreate([
           'module_id' => $moduleAppStuff->id ,
           'name' => 'Access Stuff' ,
           'slug' => 'admin.stuffs.index'
       ]);

       Permission::updateOrCreate([
           'module_id' => $moduleAppStuff->id ,
           'name' => 'Create Stuff' ,
           'slug' => 'admin.stuffs.create'
       ]);

       Permission::updateOrCreate([
           'module_id' => $moduleAppStuff->id ,
           'name' => 'Edit Stuff' ,
           'slug' => 'admin.stuffs.edit'
       ]);

       Permission::updateOrCreate([
           'module_id' => $moduleAppStuff->id ,
           'name' => 'Delete Stuff' ,
           'slug' => 'admin.stuffs.destroy'
       ]);


        // Menu management
        $moduleAppMenu = Module::updateOrCreate(['name' => 'Menu Management']);
        Permission::updateOrCreate([
            'module_id' => $moduleAppMenu->id,
            'name' => 'Access Menus',
            'slug' => 'admin.menus.index',
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppMenu->id,
            'name' => 'Access Menus Builder',
            'slug' => 'admin.menus.builder',
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppMenu->id,
            'name' => 'Create Menu',
            'slug' => 'admin.menus.create',
        ]);
        Permission::updateOrCreate([
            'module_id' => $moduleAppMenu->id,
            'name' => 'Edit Menu',
            'slug' => 'admin.menus.edit',
        ]);
        Permission::updateOrCreate([
            'module_id' => $moduleAppMenu->id,
            'name' => 'Delete Menu',
            'slug' => 'admin.menus.destroy',
        ]);


        //Sepcial Menu management
        $moduleAppFoodSpecialMenu = Module::updateOrCreate(['name' => 'Special Food Menu Management']);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialMenu->id ,
            'name' => 'Access Special Menu' ,
            'slug' => 'admin.food.special-menus.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialMenu->id ,
            'name' => 'Create Special Menu' ,
            'slug' => 'admin.food.special-menus.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialMenu->id ,
            'name' => 'Edit Special Menu' ,
            'slug' => 'admin.food.special-menus.edit'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialMenu->id ,
            'name' => 'Delete Special Menu' ,
            'slug' => 'admin.food.special-menus.destroy'
        ]);


        //Sepcial Item management
        $moduleAppFoodSpecialItem = Module::updateOrCreate(['name' => 'Special Food Item Management']);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialItem->id ,
            'name' => 'Access Special Item' ,
            'slug' => 'admin.food.special-items.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialItem->id ,
            'name' => 'Create Special Item' ,
            'slug' => 'admin.food.special-items.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialItem->id ,
            'name' => 'Edit Special Item' ,
            'slug' => 'admin.food.special-items.edit'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppFoodSpecialItem->id ,
            'name' => 'Delete Special Item' ,
            'slug' => 'admin.food.special-items.destroy'
        ]);



        //Assign Menu Item management
        $moduleAppAssignMenuItem = Module::updateOrCreate(['name' => 'Special Food Item Management']);

        Permission::updateOrCreate([
            'module_id' => $moduleAppAssignMenuItem->id ,
            'name' => 'Access Assign Menu Item' ,
            'slug' => 'admin.food.assign-menu-items.index'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppAssignMenuItem->id ,
            'name' => 'Create Assign Menu Item' ,
            'slug' => 'admin.food.assign-menu-items.create'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppAssignMenuItem->id ,
            'name' => 'Edit Assign Menu Item' ,
            'slug' => 'admin.food.assign-menu-items.edit'
        ]);

        Permission::updateOrCreate([
            'module_id' => $moduleAppAssignMenuItem->id ,
            'name' => 'Edit Assign Menu Item' ,
            'slug' => 'admin.food.assign-menu-items.show'
        ]);


        Permission::updateOrCreate([
            'module_id' => $moduleAppAssignMenuItem->id ,
            'name' => 'Delete Assign Menu Item' ,
            'slug' => 'admin.food.assign-menu-items.destroy'
        ]);
    }
}
