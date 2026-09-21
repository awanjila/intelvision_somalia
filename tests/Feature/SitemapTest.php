<?php

namespace Tests\Feature;

use Tests\TestCase;

class SitemapTest extends TestCase
{
    public function test_the_sitemap_returns_xml_with_public_routes(): void
    {
        $response = $this->get('/sitemap.xml');

        $response->assertStatus(200);
        $this->assertStringStartsWith('text/xml', $response->headers->get('Content-Type'));

        foreach (['/', '/about', '/pricing', '/products', '/blogs', '/pricings', '/store', '/delivery', '/terms', '/faqs', '/contact', '/our-works'] as $path) {
            $response->assertSee(url($path), false);
        }
    }

    public function test_the_sitemap_excludes_private_routes(): void
    {
        $response = $this->get('/sitemap.xml');

        $response->assertDontSee(url('/dashboard'), false);
        $response->assertDontSee(url('/profile'), false);
        $response->assertDontSee(url('/sitemap.xml'), false);
        $response->assertDontSee(url('/index/service'), false);
        $response->assertDontSee(url('/add/blog'), false);
        $response->assertDontSee(url('/home/slider'), false);
    }

    public function test_the_sitemap_excludes_parameterised_routes(): void
    {
        $response = $this->get('/sitemap.xml');

        $response->assertDontSee(url('/show/blog/{slug}'), false);
        $response->assertDontSee(url('/show/product-1/{slug}'), false);
        $response->assertDontSee(url('/category/{slug}'), false);
    }
}