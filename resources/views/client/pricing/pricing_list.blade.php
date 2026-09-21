@extends('client.layout.app')
@section('title')
Pricing | Security Systems and Gold Detectors in Somalia  
@endsection

@section('meta_title')
Pricing | Cost of Security Systems and Gold Detectors in Somalia  
@endsection

@section('meta_description')
Protect your home and business with advanced security systems — CCTV, electric fences, access control and fire safety — and premium gold detectors and mining equipment from Intelvision Technologies.
@endsection
@section('content')
<!--Page Title-->


	<!-- Main content Start -->
    <div class="main-content">
            
         
            <!-- Breadcrumbs Start -->
            <div class="rs-breadcrumbs img2">
                <div class="breadcrumbs-inner text-center">
                    <h1 class="page-title">Pricing</h1>
                    <ul>
                        <li title="Braintech - IT Solutions and Technology Startup HTML Template">
                            <a class="active" href="index-2.html">Home</a>
                        </li>
                       <li>Pricing</li>
                    </ul>
                </div>
            </div>
            <!-- Breadcrumbs End -->

            <!-- Pricing section start -->
            <div class="rs-pricing style2 gray-color pt-120 pb-150 md-pt-80 md-pb-80">
                <div class="container">
                    <div class="sec-title2 text-center mb-45">
                        <span class="sub-text style-bg">Pricing</span>
                        <h2 class="title title2">
                           Our Pricing & Packages Plan
                        </h2>
                    </div>
                   <div class="row">
                @foreach($packages as $item)

                       <div class="col-lg-12 md-mb-30 md-mt-30 mb-60">
                           <div class="pricing-table primary-bg">
                               <div class="pricing-badge white-color-bg">
                                   {{$item->title}}
                               </div>
                               <div class="pricing-icon">
                                   <img src="assets/images/pricing/main-home/icons/2.png" alt="">
                               </div>
                              <div class="pricing-table-price">
                                   <div class="pricing-table-bags">
                                       <span class="pricing-currency">Ksh</span>
                                       <span class="table-price-text">{{$item->price_range}}</span>
                                       
                                   </div>
                              </div>
                               <div class="pricing-table-body">
                                   <ul>
                                        <li>{{$item->description}}.</li>
                                        
                                   </ul>
                               </div>
                               <div class="btn-part">
                                   <a class="readon buy-now pricing" href="{{ route('show.pricing',$item->slug) }}">View {{$item->title}} Packages</a>
                               </div>
                           </div>
                       </div>
                      
                @endforeach
                      


                   </div>
                </div>
            </div>
            <!-- Pricing section end -->

        </div> 
        <!-- Main content End -->
     









@endsection
