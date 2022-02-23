<div class="list-group">
    <a href="{{route('admin.settings.general')}}" class="list-group-item list-group-item-action {{Route::is('admin.settings.general')?'active':''}}">General</a>

    {{-- <a href="{{route('admin.settings.appearence')}}" class="list-group-item list-group-item-action {{Route::is('admin.settings.appearence')?'active':''}}">Appearence</a> --}}

    <a href="{{route('admin.settings.mail')}}" class="list-group-item list-group-item-action {{Route::is('admin.settings.mail')?'active':''}}">Mail</a>

    <a href="{{route('admin.settings.socialite')}}" class="list-group-item list-group-item-action {{Route::is('admin.settings.socialite')?'active':''}}">Socialite</a>
</div>
