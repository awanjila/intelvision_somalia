<?php echo '<?xml version="1.0" encoding="UTF-8"?>'; ?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    @foreach ($routes as $url)
    <url>
        <loc>{{ url($url['path']) }}</loc>
        <priority>{{ $url['priority'] }}</priority>
        <changefreq>{{ $url['changefreq'] }}</changefreq>
    </url>
    @endforeach
    @foreach ($categories as $category)
    <url>
        <loc>{{ url('/category/' . $category->slug) }}</loc>
        <priority>0.6</priority>
        <changefreq>weekly</changefreq>
    </url>
    @endforeach
    @foreach ($portfolioCategories as $portfolioCategory)
    <url>
        <loc>{{ url('/portfolio/category/' . $portfolioCategory->slug) }}</loc>
        <priority>0.6</priority>
        <changefreq>weekly</changefreq>
    </url>
    @endforeach
    @foreach ($services as $service)
    <url>
        <loc>{{ url('/show/product/' . $service->slug) }}</loc>
        <priority>0.7</priority>
        <changefreq>weekly</changefreq>
        @if($service->updated_at)
        <lastmod>{{ $service->updated_at->toW3cString() }}</lastmod>
        @endif
    </url>
    @endforeach
    @foreach ($blogs as $blog)
    <url>
        <loc>{{ url('/show/blog/' . $blog->slug) }}</loc>
        <priority>0.6</priority>
        <changefreq>monthly</changefreq>
        @if($blog->updated_at)
        <lastmod>{{ $blog->updated_at->toW3cString() }}</lastmod>
        @endif
    </url>
    @endforeach
    @foreach ($pricings as $pricing)
    <url>
        <loc>{{ url('/show/pricing/' . $pricing->slug) }}</loc>
        <priority>0.6</priority>
        <changefreq>monthly</changefreq>
        @if($pricing->updated_at)
        <lastmod>{{ $pricing->updated_at->toW3cString() }}</lastmod>
        @endif
    </url>
    @endforeach
    @foreach ($products as $product)
    <url>
        <loc>{{ url('/show/product-1/' . $product->slug) }}</loc>
        <priority>0.8</priority>
        <changefreq>daily</changefreq>
        @if($product->updated_at)
        <lastmod>{{ $product->updated_at->toW3cString() }}</lastmod>
        @endif
    </url>
    @endforeach
</urlset>