@extends('client.layout.app')
@section('title')
Web Design | POS | ecommerce  | Web Design | Biometric Attendance | Cloud CCTV Storage  
@endsection

@section('meta_title')
Blog | Website Design | Point Of Sale | ecommerce  | Web Design | Biometric Attendance   
@endsection

@section('meta_description')
Boost your online presence with expert Website Design, efficient Point Of Sale systems, robust Ecommerce solutions, innovative Web Design, and secure Biometric Attendance systems. Enhance functionality and user experience.
@endsection

@section('content')

<!-- Main content Start -->
<div class="main-content">
           
            <!-- Breadcrumbs Start -->
            <div class="rs-breadcrumbs img4">
                <div class="breadcrumbs-inner text-center">
                    <h1 class="page-title">News & Updates</h1>
                    <ul>
                        <li>
                            <a class="active" href="/">Home</a>
                        </li>
                       <li>News & Updates</li>
                    </ul>
                </div>
            </div>
            <!-- Breadcrumbs End -->

            <!-- Blog Section Start -->
            <div class="rs-inner-blog pt-120 pb-120 md-pt-90 md-pb-90">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 order-last">
                            <div class="widget-area">
                                <div class="search-widget mb-50">
                                    <div class="search-wrap">
                                        <input type="search" placeholder="Searching..." name="s" class="search-input" value="">
                                        <button type="submit" value="Search"><i class="flaticon-search"></i></button>
                                    </div>
                                </div>
                                <div class="recent-posts mb-50">
                                    <div class="widget-title">
                                        <h3 class="title">Latest Posts</h3>
                                    </div>
                                    @foreach($blog_posts->sortByDesc('created_at') as $item)
                                    <div class="recent-post-widget">
                                        <div class="post-img">
                                            <a href="{{ route('show.blog',$item->slug) }}"><img src="{{asset($item->image)}}" alt="{{$item->name}}"></a>
                                        </div>
                                        <div class="post-desc">
                                            <a href="{{ route('show.blog',$item->slug) }}">{{$item->name}} </a>
                                            <span class="date">
                                                <i class="fa fa-calendar"></i>
                                                {{ $item->created_at->format('F j, Y') }}
                                            </span>
                                        </div>
                                    </div>
                                    @endforeach
                                    
                                </div>

                                @php 
                                $blog_cats = \App\Models\BackOffice\BlogCategory::latest()->get();
                                @endphp
                                <div class="categories mb-50">
                                    <div class="widget-title">
                                        <h3 class="title">Categories</h3>
                                    </div>
                                    <ul>
                                        @foreach($blog_cats as $item)
                                        <li><a href="#">{{$item->name}}</a></li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 pr-35 md-pr-15">
                            <div class="row">
                                @foreach($blog_posts as $item)
                                <div class="col-lg-12 mb-50">
                                    <div class="blog-item">
                                        <div class="blog-img">
                                            <a href="{{ route('show.blog',$item->slug) }}"><img src="{{asset($item->image)}}" alt="{{$item->name}}"></a>
                                            <ul class="post-categories">
                                                <li><a href="{{ route('show.blog',$item->slug) }}">{{$item->category->name}}</a></li>
                                            </ul>
                                        </div>
                                        <div class="blog-content">
                                            <h3 class="blog-title"><a href="{{ route('show.blog',$item->slug) }}">{{$item->name}}</a></h3>
                                            <div class="blog-meta">
                                                <ul class="btm-cate">
                                                    <li>
                                                        <div class="blog-date">
                                                            <i class="fa fa-calendar-check-o"></i> {{ $item->created_at->format('F j, Y') }}                                                     
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="author">
                                                            <i class="fa fa-user-o"></i> {{$item->author}} 
                                                        </div>
                                                    </li> 
                                                </ul>
                                            </div>
                                            <div class="blog-desc">   
                                            {{ substr(strip_tags($item->description), 0, 110) . (strlen(strip_tags($item->description)) > 110 ? '...' : '') }}..
                                            </div>
                                            <div class="blog-button inner-blog">
                                                <a class="blog-btn" href="{{ route('show.blog',$item->slug) }}">Continue Reading</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                                
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
            <!-- Blog Section End --> 

        </div> 
        <!-- Main content End -->
     



@endsection
