<?php

namespace App\Http\Controllers\BackOffice;
use App\Http\Controllers\Controller;
use App\Models\BackOffice\BlogCategory;
use App\Models\BackOffice\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;
use Storage;
use App\Mail\BlogMail;
use App\Models\Contact;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BlogController extends Controller
{
    public function AddBlog(){


        $blogcats = BlogCategory::all();


        return view('admin.backOffice.blog.add_blog', compact('blogcats'));

    }//endmethod




    public function StoreBlog(Request $request)
{
    $data = $this->validate($request, [
        'name' => 'required',
        'description' => 'required',
        'author' => 'required',
    ]);

    $slug = Str::slug($request->name);
    $save_url = null;

    if ($request->file('image')) {
        $image = $request->file('image');
        $name_gen = $slug . '.' . $image->getClientOriginalExtension();
        Image::make($image)->resize(800, 400)->save('upload/blog_image/' . $name_gen);
        $save_url = 'upload/blog_image/' . $name_gen;
    }

    // Use DB::insert instead of Eloquent
    DB::table('blogs')->insert([
        'name' => $request->name,
        'description' => $request->description,
        'meta_title' => $request->meta_title,
        'meta_description' => $request->meta_description,
        'author' => $request->author,
        'blog_category_id' => $request->category,
        'image' => $save_url,
        'created_at' => now(),
        'updated_at' => now(),
    ]);

    $notification = [
        'message' => 'Blog ' . ($save_url ? 'with Image ' : 'without Image ') . 'has been Created Successfully',
        'alert-type' => $save_url ? 'info' : 'warning',
    ];

    // Optimize email sending - use queue and chunk
    Contact::chunk(100, function ($contacts) use ($data, $save_url) {
        foreach ($contacts as $contact) {
            Mail::to($contact->email)
                ->queue(new BlogMail($data, $save_url, $contact->name));
        }
    });

    return redirect()->route('index.blog')->with($notification);
}//endmethod
    



    public function DeleteBlog($id){

        Blog::findOrFail($id)->delete();

        $notification = array(
            'message' => 'Blog Deleted Successfully',
            'alert-type' => 'warning'
        );

        return redirect()->back()->with($notification);

}//endmethod





public function AddBlogCategory(){


 return view('admin.backOffice.blog.add_blog_category');

    }//endmethod




    public function UpdateBlog(Request $request){

       $blog_id = $request->id;

       $validateData = $request->validate([
        'name' => 'required',
        'description' => 'required',
    ]);

       if ($request->file('image')) {
        $image = $request->file('image');
        $name_gen = hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        Image::make($image)->resize(669, 499)->save('upload/blog_image/' . $name_gen);
        $save_url = 'upload/blog_image/' . $name_gen;
        Blog::findOrFail($blog_id)->update([

         'name' => $request->name,
         'description' => $request->description,
         'image' => $save_url,
         'author' => $request->author,
         'category' => $request->category,

     ]);

        $notification = array(
            'message' => 'Blog Post With Image has been Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('index.blog')->with($notification);
    } else {
        Blog::findOrFail($blog_id)->update([
         'name' => $request->name,
         'description' => $request->description,
            // 'image' => $save_url,
         'author' => $request->author,
         'category' => $request->category,

     ]);

        $notification = array(
            'message' => 'Blog Post without an Image has been Updated Successfully',
            'alert-type' => 'warning'
        );

        return redirect()->route('index.blog')->with($notification);
    }


    }//endmethod



    public function StoreBlogCategory(Request $request){

     $validateData = $request->validate([
        'title' => 'required',
            // 'description' => 'required',
    ]);

     
     $blog_cat = new BlogCategory();
     $blog_cat->name = $request->title;
     $blog_cat->description = $request->short_title;
     $blog_cat->save();

     $notification = [
        'message' => 'Blog category has been Created Successfully',
        'alert-type' => 'warning'
    ];


           // dd($notification);

    return redirect()->route('index.blog.category')->with($notification);
    

    }//endmethod


    public function IndexOfBlogs(){

       $blogs = Blog::with('category')
        ->orderBy('created_at', 'desc')
        ->get();

    return view('admin.backOffice.blog.index_blog', compact('blogs'));
    }//endmethod

    public function IndexOfBlogCategories(){

      $blog_cats=BlogCategory::orderBy('created_at', 'desc')->get();

      return view('admin.backOffice.blog.index_blog_category')->with('blog_cats', $blog_cats);
    }//endmethod





    public function DeleteBlogCategory($id){
     BlogCategory::findOrFail($id)->delete();

     $notification = array(
        'message' => 'Blog Category Deleted Successfully',
        'alert-type' => 'warning'
    );

     return redirect()->back()->with($notification);


    }//endmethod


    public function IndexOfClientBlogs(){

        $blog_posts=Blog::get();
        $data = Blog::paginate(5);
        return view("client.blog.blog_list")->with('blog_posts', $blog_posts)->with('data', $data);
    }//endmethod



    public function ShowBlog($slug){

        $blog=blog::where('slug', $slug)->firstOrFail();
        $blog_posts=blog::get();
        $blogcats = blogCategory::get();
    // $blogcategory=blogCategory::where('slug', $slug)->firstOrFail();

     // $post = Post::find($id);
        $previous = blog::where('slug', '<', $blog->slug)->max('slug');
        $next = blog::where('slug', '>', $blog->slug)->min('slug');
    // return view( 'post', compact( 'post', 'next', 'previous' ));



        return view('client.blog.blog_details')->with('blog', $blog)->with('blog_posts', $blog_posts)->with('blogcats', $blogcats)->with('previous', $previous)->with('next', $next);

    }//endmethod
}
