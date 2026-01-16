@extends('client.layout.app')
@section('title')
{{$blog->name}} 
@endsection

@section('meta_title')

    {{$blog->meta_title}}
@endsection

@section('meta_description')

    {{$blog->meta_description}}

@endsection
<!-- subheader -->
@section('content')


<!-- Main content Start -->
<div class="main-content">
            
         
            <!-- Breadcrumbs Start -->
            <div class="rs-breadcrumbs img4">
                <div class="breadcrumbs-inner text-center">
                    <h1 class="page-title new-title pb-10">{{$blog->name}}</h1>
                    <ul>
                        <li title="{{$blog->name}}">
                            <a class="active" href="/">Home</a>
                        </li>
                        <li title="Go to Blog"><a class="active" href="{{ route('blogs.index')}}">Blog</a></li>
                        <li title="Go to the It Services category archives"><a class="active" href="/">{{$blog->category->name}}</a></li>
                        <li>{{$blog->name}}</li>
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
                                <div class="col-lg-12">
                                    <div class="blog-details">
                                        <div class="bs-img mb-35">
                                            <a href="#"><img src="{{ asset($blog->image) }}" alt="{{$blog->name}}"></a>
                                        </div>
                                        <div class="blog-full">
                                            <ul class="single-post-meta">
                                                <li>
                                                    <span class="p-date"><i class="fa fa-calendar-check-o"></i> {{ $blog->created_at->format('F j, Y') }} </span>
                                                </li> 
                                                <li>
                                                    <span class="p-date"> <i class="fa fa-user-o"></i> {{$blog->author}} </span>
                                                </li> 
                                                <li class="Post-cate">
                                                    <div class="tag-line">
                                                        <i class="fa fa-book"></i>
                                                        <a href="#">{{$blog->category->name}}</a>
                                                    </div>
                                                </li>
                                                
                                            </ul>
                                            <p>
                                            {!! $blog->description !!}
                                            </p>
                                            
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
            <!-- Blog Section End --> 

        </div> 
        <!-- Main content End -->
           


    @endsection
