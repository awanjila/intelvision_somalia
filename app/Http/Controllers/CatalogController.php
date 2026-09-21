<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Models\Product;

use Illuminate\Http\Request;

class Catalogcontroller extends Controller
{
    
    public function index()
    {
        return view('client.shop.shop_categories');
    }//endmethod


    public function showProducts($slug)
    {
        $category = Category::where('slug', $slug)->firstOrFail();
        $items = Product::where('category_id', $category->id)->get();

        return view('client.shop.category_product_list', compact('category', 'items'));
    }//endmethod


    public function showBrandProducts($slug)
    {
        return redirect()->route('catalog.index');
    }//endmethod


    public function showByCategory($slug)
{
    $category = Category::where('slug', $slug)->firstOrFail();
    $items = Product::where('category_id', $category->id)->get();

    return view('client.shop.category_product_list', compact('category', 'items'));
}//endmethod


public function show($slug)
{
    $product = Product::where('slug', $slug)->firstOrFail();

      // Retrieve the category associated with the product
    $category = $product->category;

    $products = Product::where('category_id', $category->id)
                        ->where('id', '!=', $product->id)
                        ->get();


    return view('client.shop.shop_product', compact('product', 'products'));
}//endmethod


public function faq()
{
    return view('client.faqs');
}//endmethod


public function searchProducts(Request $request)
{
    $q = trim((string) $request->query('q', ''));
    $items = $q !== '' ? Product::where('product_name', 'like', '%'.$q.'%')->get() : collect();

    return view('client.shop.search_results', compact('items', 'q'));
}//endmethod


public function Delivery()
{
    return view('client.delivery');
}//endmethod


public function Terms()
{
    return view('client.terms');
}//endmethod


public function BDistributor()
{
    return view('client.distributor_application');
}//endmethod


public function ADistributor(Request $request)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|email|max:255',
        'phone' => 'required|string|max:30',
        'company' => 'nullable|string|max:255',
        'region' => 'nullable|string|max:255',
        'message' => 'nullable|string',
    ]);

    return redirect()->route('bdistributor')->with('success', 'Your distributor application has been received. We will contact you soon.');
}//endmethod
}
