<?php

namespace App\Http\Controllers;

use App\Models\BackOffice\Blog;
use App\Models\BackOffice\PortfolioCategory;
use App\Models\BackOffice\Service;
use App\Models\Category;
use App\Models\FrontEnd\Pricing;
use App\Models\Product;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use Throwable;

class SitemapController extends Controller
{
    protected $publicRoutes = [
        'home',
        'about',
        'pricing',
        'services',
        'blogs.index',
        'pricings.index',
        'catalog.index',
        'delivery',
        'terms',
        'faqs',
        'bdistributor',
        'contact',
        'ourworks',
    ];

    public function index()
    {
        $routes = collect(Route::getRoutes())
            ->filter(fn ($route) => in_array('GET', $route->methods()))
            ->filter(fn ($route) => in_array($route->getName(), $this->publicRoutes))
            ->map(function ($route) {
                $path = '/' . ltrim($route->uri(), '/');

                return [
                    'path' => $path,
                    'priority' => $path === '/' ? '1.0' : ($path === '/store' ? '0.9' : '0.7'),
                    'changefreq' => $path === '/' ? 'weekly' : ($path === '/store' ? 'daily' : 'monthly'),
                ];
            })
            ->unique('path')
            ->values();

        return response()->view('sitemap', [
            'routes' => $routes,
            'products' => $this->records(fn () => Product::get()),
            'services' => $this->records(fn () => Service::get()),
            'blogs' => $this->records(fn () => Blog::get()),
            'pricings' => $this->records(fn () => Pricing::get()),
            'categories' => $this->records(fn () => Category::get()),
            'portfolioCategories' => $this->records(fn () => PortfolioCategory::get()),
        ])->header('Content-Type', 'text/xml');
    }

    protected function records(callable $query)
    {
        try {
            return $query();
        } catch (Throwable $e) {
            Log::warning('Sitemap could not load records: ' . $e->getMessage());

            return collect();
        }
    }
}