<div class="aside-content">
    <div class="aside-header">
        <button class="navbar-toggle" data-target=".aside-nav" data-toggle="collapse" type="button">
            <span class="icon"><i data-feather="chevron-down"></i></span>
        </button>
        <span class="title text-muted font-weight-bold">Почта хизмати</span>
        <p class="text-muted">{{auth()->user()->email}}</p>
    </div>
    <div class="aside-compose">
        <a class="btn btn-primary btn-block" href="../../../demo_1/pages/email/compose.html">Топшириқ яратиш</a>
    </div>
    <div class="aside-nav collapse">
        <ul class="nav">
            <li><a href="../../../demo_1/pages/email/inbox.html"><span class="icon"><i data-feather="inbox"></i></span>Кириш қутиси<span class="badge badge-danger-muted text-white font-weight-bold float-right">2</span></a></li>
            <li class="active"><a href="#"><span class="icon"><i data-feather="mail"></i></span>Юборилган хатлар</a></li>
            <li><a href="#"><span class="icon"><i data-feather="file"></i></span>Қораламалар</a></li>
            <li><a href="#"><span class="icon"><i data-feather="star"></i></span>Теглар</a></li>
            <li><a href="#"><span class="icon"><i data-feather="trash"></i></span>Чиқиндилар</a></li>
        </ul>
        <span class="title">Ёрлиқлар</span>
        <ul class="nav nav-pills nav-stacked">
            <li><a href="#"><i data-feather="tag" class="text-warning"></i> Мухим </a></li>
            <li><a href="#"><i data-feather="tag" class="text-primary"></i> Бизнес </a></li>
            <li><a href="#"><i data-feather="tag" class="text-info"></i> Илҳом </a></li>
        </ul>
    </div>
</div>