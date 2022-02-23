<?php

namespace Database\Seeders;

use App\Models\Menu;
use App\Models\MenuItem;
use Illuminate\Database\Seeder;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //Backend Sidebar

        $menu = Menu::updateOrCreate([
            'name' => 'backend-sidebar',
            'description' => 'This is backend sidebar',
            'deletable' => false]);


        MenuItem::updateOrCreate([
            'menu_id' => $menu->id,
            'type' => 'divider',
            'parent_id' => null,
            'order' => 1,
            'divider_title' => 'Access Control'
        ]);

        $menu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 2,
            'title' => 'Dashboard',
            'url' => "/admin/dashboard",
            'icon_class' => 'metismenu-icon pe-7s-rocket'
            ]);


        $menu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 3,
            'title' => 'Roles',
            'url' => "/admin/roles",
            'icon_class' => 'metismenu-icon pe-7s-check'
        ]);

        $menu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 4,
            'title' => 'User',
            'url' => "/admin/users",
            'icon_class' => 'metismenu-icon pe-7s-users'
            ]);


        $menu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 5,
            'title' => 'Menus',
            'url' => "/admin/menus",
            'icon_class' => 'metismenu-icon pe-7s-menu'
        ]);

        $menu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 6,
            'title' => 'Backup',
            'url' => "/admin/backups",
            'icon_class' => 'metismenu-icon pe-7s-cloud'
        ]);

        $menu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 10,
            'title' => 'Settings',
            'url' => "/admin/settings/general",
            'icon_class' => 'metismenu-icon pe-7s-settings'
        ]);


       //fontent header

        $frontendMenu = Menu::updateOrCreate([
            'name' => 'frontend-header',
            'description' => 'This is frontend header',
            'deletable' => false]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 1,
            'title' => 'Home',
            'url' => "/"
        ]);


        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 2,
            'title' => 'Menu',
            'url' => "/menu"
        ]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 3,
            'title' => 'About',
            'url' => "/about"
        ]);


        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 4,
            'title' => 'Pages',
            'url' => "#"
        ]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 5,
            'title' => 'Reservation',
            'url' => "/reservation"
        ]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 6,
            'title' => 'Stuff',
            'url' => "/stuff"
        ]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 7,
            'title' => 'Gallery',
            'url' => "/gallary"
        ]);


        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 8,
            'title' => 'Blog',
            'url' => "#"
        ]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 9,
            'title' => 'Blog',
            'url' => "/blog"
        ]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 10,
            'title' => 'Blog Single',
            'url' => "/blog-detail"
        ]);

        $frontendMenu->menuItems()->updateOrCreate([
            'type' => 'item',
            'parent_id' => null,
            'order' => 11,
            'title' => 'Contact',
            'url' => "/contact"
        ]);





    }
}