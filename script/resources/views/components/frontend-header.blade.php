@foreach ($items as $item)
    @if ($item->type=='divider')
    There is no Divider
    @else
        @if($item->childs->isEmpty())
            <li class="nav-item {{ Request::is(ltrim($item->url,'/').'*') ? 'active' : '' }}">
                <a href="{{ url($item->url) }}" class="nav-link">
                    {{ $item->title }}
                </a>
            </li>
        @else
            <li
            @foreach($item->childs as $child)
                @if (Request::is(ltrim($child->url,'/').'*'))
                    class="nav-item dropdown active"
                    @break
                @endif
            @endforeach
            >
                <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">
                    {{ $item->title }}
                </a>
                <div class="dropdown-menu" >
                    @foreach($item->childs as $child)
                        <a class="dropdown-item {{ Request::is(ltrim($child->url,'/').'*') ? 'active' : '' }}"  href="{{ url($child->url) }}">
                            {{ $child->title }}
                        </a>
                    @endforeach
                </div>
            </li>
        @endif
    @endif
@endforeach
