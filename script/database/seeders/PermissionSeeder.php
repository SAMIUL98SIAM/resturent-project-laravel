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

    }
}
