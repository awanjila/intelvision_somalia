@extends('admin.admin_master')

@section('title')
Admin | Edit Service
@endsection

@section('content')
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link href="{{ asset('backend/assets/libs/quill/quill.snow.css') }}" rel="stylesheet" />
    <script src="{{ asset('backend/assets/libs/quill/quill.min.js') }}"></script>
    <style>
        #description-editor .ql-editor { min-height: 250px; }
    </style>

    <div class="content-page">
        <div class="content">
            <!-- Start Content-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Edit Product </h4>

                                @if (session('message'))
                                <div class="alert alert-{{ session('alert-type') }}">
                                    {{ session('message') }}
                                </div>
                                @endif

                                <form method="post" action="{{ route('update.service') }}" enctype="multipart/form-data" id="sliderForm">
                                    @csrf


                                    <input name="id" class="form-control" type="hidden" id="title-input" value="{{$service->id}}">
                                    <div class="row mb-3">
                                        <label for="example-text-input" class="col-sm-2 col-form-label">Title</label>
                                        <div class="col-sm-10">
                                            <input name="title" class="form-control" type="text" id="title-input" value="{{$service->name}}">
                                            <span class="text-danger" id="title-error"></span>
                                        </div>
                                    </div>
                                    <!-- end row -->
                                    <div class="row mb-3">
                                        <label for="title-input" class="col-sm-2 col-form-label">Meta Title</label>
                                        <div class="col-sm-10">
                                            <input name="meta_title" class="form-control" type="text" id="title-input"  value="{{$service->meta_title}}">
                                            <span class="text-danger" id="title-error"></span>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="service-category" class="col-sm-2 col-form-label">Service Category</label>
                                        <div class="col-sm-10">
                                            <select name="category" class="form-control" id="service-category">
                                                <option value="Security Systems" {{ $service->category == 'Security Systems' ? 'selected' : '' }}>Security Systems</option>
                                                <option value="Gold Detectors" {{ $service->category == 'Gold Detectors' ? 'selected' : '' }}>Gold Detectors</option>
                                            </select>
                                            <span class="text-danger" id="category-error"></span>
                                        </div>
                                    </div>
                                    <!-- end row -->

                                <div class="row mb-3">
                                        <label for="meta-description-input" class="col-sm-2 col-form-label">Meta Description</label>
                                        <div class="col-sm-10">
                                            <textarea name="meta_description" class="form-control" id="meta-description-input">{{$service->meta_description}}</textarea>
                                            <span class="text-danger" id="meta-description-error"></span>
                                        </div>
                                    </div>
                                    <!-- end row -->

                                    <div class="row mb-3">
                                        <label for="example-text-input" class="col-sm-2 col-form-label">Description</label>
                                        <div class="col-sm-10">
                                            <textarea name="description" class="form-control" id="description-input" style="display:none;">{{$service->description}}</textarea>
                                            <div id="description-editor">{!! $service->description !!}</div>
                                            <span class="text-danger" id="description-error"></span>
                                        </div>
                                    </div>
                                    <!-- end row -->

                                    <div class="row mb-3">
                                        <label for="example-text-input" class="col-sm-2 col-form-label">Service Image</label>
                                        <div class="col-sm-10">
                                            <input name="image" class="form-control" type="file" id="image-input">
                                            
                                        </div>
                                    </div>
                                    <!-- end row -->

                                    <div class="row mb-3">
                                        <label for="example-text-input" class="col-sm-2 col-form-label"></label>
                                        <div class="col-sm-10">
                                            <img id="showImage" class="rounded avatar-lg" src="{{ (!empty($service->image))? url($service->image):url('upload/no_image.jpg') }}" alt="Service image preview">
                                        </div>
                                    </div>
                                    <!-- end row -->
                                    <input type="submit" class="btn btn-info waves-effect waves-light" value="Update Service">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            @if (session('message'))
            toastr.{{ session('alert-type') }}('{{ session('message') }}');
            @endif

           


            $('#sliderForm').submit(function(e) {
                e.preventDefault();

                // Sync Quill content back to the hidden textarea
                if (typeof descriptionQuill !== 'undefined') {
                    $('#description-input').val(descriptionQuill.root.innerHTML);
                }

                // Clear previous error messages
                $('.text-danger').text('');

                // Retrieve form inputs
                var title = $('#title-input').val();
                var description = $('#description-input').val();
                var metaDescription = $('#meta-description-input').val();

                // Perform validation
                var isValid = true;

                if (title.trim() === '') {
                    $('#title-error').text('Title is required.');
                    isValid = false;
                }

                if (description.trim() === '') {
                    $('#description-error').text('Description is required.');
                    isValid = false;
                }

                if (metaDescription.trim() === '') {
                    $('#meta-description-error').text('Meta description is required.');
                    isValid = false;
                }

                if (isValid) {
                    toastr.success('Form submitted successfully.');
                    this.submit();
                } else {
                    toastr.error('Please fill in all the required fields.');
                }
            });

            $('#image-input').change(function(e) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#showImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(e.target.files[0]);
            });
            
            var descriptionQuill = new Quill('#description-editor', {
                theme: 'snow',
                modules: {
                    toolbar: [
                        [{ header: [1, 2, 3, 4, 5, 6, false] }],
                        ['bold', 'italic', 'underline', 'strike'],
                        [{ color: [] }, { background: [] }],
                        [{ list: 'ordered' }, { list: 'bullet' }, { indent: '-1' }, { indent: '+1' }],
                        [{ align: [] }],
                        ['link', 'image'],
                        ['clean']
                    ]
                },
                placeholder: 'Enter service description...'
            });
        });
    </script>
    @endsection
