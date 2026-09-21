@extends('client.layout.app')
@section('title')
Search | Security Systems & Gold Detectors | Intelvision Technologies
@endsection

@section('meta_title')
Search Products | CCTV, Electric Fences & Gold Detectors | Intelvision Technologies
@endsection

@section('meta_description')
Search Intelvision Technologies’ catalogue — CCTV, electric fences, access control, fire safety and premium gold detectors and mining equipment.
@endsection

@section('content')
<!-- Breadcrumbs Start -->
<div class="rs-breadcrumbs img3">
    <div class="breadcrumbs-inner text-center">
        <h1 class="page-title">Search Results</h1>
        <ul>
            <li class="active"><a href="/">Home</a></li>
            <li>Search</li>
        </ul>
    </div>
</div>
<!-- Breadcrumbs End -->

<!--Shop part start-->
<div class="rs-shop-part pt-120 pb-120 md-pt-70 md-pb-80">
    <div class="container">
        <div class="row mb-50">
            <div class="col-12">
                <form action="{{ route('search') }}" method="GET" class="search-form">
                    <div class="form-group d-flex">
                        <input type="text" name="q" value="{{ $q }}" class="form-control" placeholder="Search CCTV, gold detectors, electric fences..." style="margin-right:10px;">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            @if($items->count() > 0)
                @foreach($items as $p)
                    <div class="col-lg-4 col-md-6 mb-80">
                        <div class="product-list">
                            <div class="image-product">
                                <img src="{{ asset($p->product_image) }}" alt="{{ $p->product_name }}">
                            </div>
                            <div class="content-desc text-center">
                                <h2 class="loop-product-title pt-15"><a href="{{ route('show.product', $p->slug) }}">{{ $p->product_name }}</a></h2>
                                <span class="price">Ksh {{ $p->selling_price }}.00</span>
                            </div>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="col-12 text-center">
                    <p>No products found{{ $q !== '' ? ' for "' . e($q) . '"' : '' }}. Try a different search term.</p>
                </div>
            @endif
        </div>
    </div>
</div>
<!--Shop part end-->
@endsection