{extends 'common/layout.tpl'}

{block name=content}
    <link rel="stylesheet" href="{$BASE_URL}css/home.css">

    {include file='common/left-panel.tpl' grid_opt="col-md-2 text-xs-center"}

    {function name=product_card}
    {$price = getProductPrice($product)}
    {$discount = $price != $product['price']}

    <a href="{$BASE_URL}pages/products/product.php?id={$product['idproduct']}" class="product-card-link">
        <div class="card product-card text-xs-center">
            <img class="card-img-top img-fluid" alt="Product Image" src="http://placehold.it/350x250"/>
            <div class="card-block">
                <h4 class="card-title">{$product.name}</h4>
                <span class="price-tag">€{getProductPrice($product)}</span>
                {if $discount}
                    <small class="discount-ammount">-{$product['discount']}%</small>
                {/if}
            </div>
            {if $discount}
                <div class="card-footer text-muted">
                    Ends in
                    {dateDiff($product['discountend'], null)}
                    days
                </div>
            {/if}
        </div>
    </a>
{/function}

<div class="main-content col-md-10">
    <h3>Featured Products</h3>
    {if count($featured) > 0}
        <div class="row featured">
            {foreach $featured as $product}
                <div class="featured-product col-sm-4">
                    {product_card product=$product}
                </div>
            {/foreach}
        </div>
    {else}
        <h4 class="text-muted">There are no featured products</h4>
    {/if}
    <h3>Discounts</h3>
    {if count($discounts) > 0}
        <div class="row discounts">
            {foreach $discounts as $product}
                <div class="discount-product col-sm-4">
                    {product_card product=$product discount=true}
                </div>
            {/foreach}
        </div>
    {else}
        <h5 class="text-muted">There are no discounts at the moment</h5>
    {/if}
</div>
{/block}
