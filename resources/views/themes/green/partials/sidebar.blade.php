<aside id="sidebar" class="sidebar">
    <div class="logo-container">
        <a href="{{url('/')}}" class="logo d-flex align-items-center">
            <img src="{{ getFile(basicControl()->logo_driver, basicControl()->logo) }}" alt="ChainCity">
        </a>
    </div>

    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.dashboard'])}}" href="{{ route('user.dashboard') }}">
                <i class="fa-regular fa-grid"></i>
                <span>@lang('dashboard')</span>
            </a>
        </li>

        @php
            $segments = request()->segments();
            $last  = end($segments);
            $propertyMarketSegments = ['investment-properties', 'property-share-market', 'my-investment-properties', 'my-shared-properties', 'my-offered-properties', 'receive-offered-properties', 'offer-conversation'];
        @endphp

        <li class="nav-item">
            <a class="nav-link  {{ in_array($last, $propertyMarketSegments) || in_array($segments[1], $propertyMarketSegments) ? 'active' : '' }}"
               data-bs-target="#crm" data-bs-toggle="collapse" href="javascript:void(0)"
               aria-expanded="{{ in_array($last, $propertyMarketSegments) || in_array($segments[1], $propertyMarketSegments) ? 'true' : 'false' }}">
                <i class="fa-regular fa-car-building"></i><span>@lang('Property Market')</span>
                <i class="fa-regular fa-angle-down ms-auto bi-chevron-down"></i>
            </a>

            <ul id="crm"
                class="nav-content collapse {{ in_array($last, $propertyMarketSegments) || in_array($segments[1], $propertyMarketSegments) ? 'show' : '' }}"
                data-bs-parent="#sidebar-nav">
                <li>
                    <a class="{{($last == 'investment-properties') ? 'active' : '' }}"
                       href="{{ route('user.propertyMarket', 'investment-properties') }}">
                        <i class="fa-regular fa-circle"></i><span>@lang('Investment Properties')</span>
                    </a>
                </li>
                @if(basicControl()->is_share_investment == 1)
                    <li>
                        <a class="{{($last == 'property-share-market') ? 'active' : '' }}"
                           href="{{ route('user.propertyMarket', 'property-share-market') }}">
                            <i class="fa-regular fa-circle"></i><span>@lang('Share Market')</span>
                        </a>
                    </li>
                @endif

                <li>
                    <a class="{{($last == 'my-investment-properties') ? 'active' : '' }}"
                       href="{{ route('user.propertyMarket', 'my-investment-properties') }}">
                        <i class="fa-regular fa-circle"></i><span>@lang('My Properties')</span>
                    </a>
                </li>

                @if(basicControl()->is_share_investment == 1)
                    <li>
                        <a class="{{($last == 'my-shared-properties') ? 'active' : '' }}"
                           href="{{ route('user.propertyMarket', 'my-shared-properties') }}">
                            <i class="fa-regular fa-circle"></i><span>@lang('My Shared Properties')</span>
                        </a>
                    </li>

                    <li>
                        <a class="{{($last == 'my-offered-properties') ? 'active' : '' }}"
                           href="{{ route('user.propertyMarket', 'my-offered-properties') }}">
                            <i class="fa-regular fa-circle"></i><span>@lang('Send Offer')</span>
                        </a>
                    </li>

                    <li>
                        <a class="{{($last == 'receive-offered-properties' || request()->routeIs('user.offerList')) ? 'active' : '' }}"
                           href="{{ route('user.propertyMarket', 'receive-offered-properties') }}">
                            <i class="fa-regular fa-circle"></i><span>@lang('Receive Offer')</span>
                        </a>
                    </li>
                @endif

            </ul>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.invest-history'])}}" href="{{route('user.invest-history')}}"><i
                    class="fal fa-history"></i>@lang('Invest History')</a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.wishListProperty'])}}" href="{{ route('user.wishListProperty') }}">
                <i class="fal fa-heart"></i> @lang('WishList')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.add.fund'])}}" href="{{route('user.add.fund')}}">
                <i class="fa-regular fa-wallet"></i>
                @lang('Add Fund')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.fund.history', 'user.fund.history.search'])}}"
               href="{{route('user.fund.history')}}">
                <i class="fa-regular fa-wallet"></i>
                @lang('Fund History')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.payout', 'user.payout.confirm'])}}" href="{{route('user.payout')}}">
                <i class="fal fa-credit-card"></i>
                @lang('Payout')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.payout.history'])}}" href="{{route('user.payout.history')}}">
                <i class="fa-regular fa-wallet"></i>@lang('Payout History')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.money.transfer'])}}" href="{{route('user.money.transfer')}}">
                <i class="fal fa-exchange-alt"></i>
                @lang('Money Transfer')
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.money.transfer.history'])}}" href="{{route('user.money.transfer.history')}}">
                <i class="fa-regular fa-wallet"></i>@lang('Transfer History')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.transaction', 'user.transaction.search'])}}"
               href="{{route('user.transaction')}}">
                <i class="fal fa-money-check-alt"></i>
                @lang('Transaction')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.referral'])}}" href="{{route('user.referral')}}">
                <i class="fal fa-money-check-alt"></i>
                @lang('My Referral')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link {{menuActive(['user.referral.bonus', 'user.referral.bonus.search'])}}"
               href="{{route('user.referral.bonus')}}">
                <i class="fal fa-hand-holding-usd"></i>
                @lang('Referral Bonus')
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed {{menuActive(['user.ranks'])}}" href="{{route('user.ranks')}}">
                <i class="fa-sharp fa-regular fa-award"></i>
                <span>@lang('Rankings')</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed {{menuActive(['user.ticket.list', 'user.ticket.create', 'user.ticket.view'])}}"
               href="{{route('user.ticket.list')}}">
                <i class="fa-regular fa-headset"></i>
                <span>
                    @lang('Support ticket')
                </span>
            </a>
        </li>

        <li class="nav-item d-lg-none">
            <a class="nav-link collapsed {{menuActive(['user.twostep.security'])}}"
               href="{{route('user.twostep.security')}}">
                <i class="fa-regular fa-headset"></i>
                <span>
                    @lang('2FA Security')
                </span>
            </a>
        </li>

    </ul>
</aside>
