@extends('client.layout.app')

@section('title')
    {{$service->name}} | Intelvison Technologies | 0781312070
@endsection

@section('meta_title')
    {{$service->meta_title}}
@endsection

@section('meta_description')
    {{$service->meta_description}}
@endsection

@section('content')

<service-detail></service-detail>

@endsection
