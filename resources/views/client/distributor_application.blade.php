@extends('client.layout.app')
@section('title')
Become a Distributor | Intelvision Technologies
@endsection

@section('meta_title')
Become a Distributor | Intelvision Technologies | Security Systems & Gold Detectors
@endsection

@section('meta_description')
Apply to become an Intelvision Technologies distributor for security systems, CCTV, electric fences and gold detection equipment in Somalia.
@endsection

@section('content')
<!-- Breadcrumbs Start -->
<div class="rs-breadcrumbs img2">
    <div class="breadcrumbs-inner text-center">
        <h1 class="page-title">Distributor Application</h1>
        <ul>
            <li class="active"><a href="/">Home</a></li>
            <li>Distributor Application</li>
        </ul>
    </div>
</div>
<!-- Breadcrumbs End -->

<div class="rs-about gray-color pt-100 pb-100 md-pt-70 md-pb-70">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title text-center mb-50">
                    <span class="sub-text style-bg">Partnership</span>
                    <h2 class="title">Become a Distributor</h2>
                    <p>Partner with Intelvision Technologies to distribute security systems and gold detection equipment across your region.</p>
                </div>
            </div>
        </div>
        @if(session('success'))
            <div class="row">
                <div class="col-12 text-center mb-50">
                    <p class="text-success" style="font-size:1.1rem;">{{ session('success') }}</p>
                </div>
            </div>
        @endif
        <div class="row">
            <div class="col-lg-8 offset-lg-2">
                <form method="POST" action="{{ route('adistributor') }}">
                    @csrf
                    <div class="form-group mb-3">
                        <label for="name">Full Name</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="company">Company Name</label>
                        <input type="text" name="company" id="company" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="phone">Phone</label>
                        <input type="text" name="phone" id="phone" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="region">Region / City</label>
                        <input type="text" name="region" id="region" class="form-control">
                    </div>
                    <div class="form-group mb-3">
                        <label for="message">Message</label>
                        <textarea name="message" id="message" rows="4" class="form-control"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Application</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection