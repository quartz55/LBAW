{extends 'common/layout.tpl'}

{block name=content}
<link rel="stylesheet" href="{$BASE_URL}css/shoppingcart.css">

{include file='common/left-panel.tpl' grid_opt='col-sm-2 text-xs-center text-sm-left'}

<div class="col-sm-10 main-content">
    <h3>Shopping Cart <span id="num-products" class="text-muted">({count($products)} product{if count($products) != 1}s{/if})</span></h3>

    {foreach $products as $product}
        <article class="product row">
            <a class="product-link col-xs-11" href="{$BASE_URL}pages/products/product.php?id={$product.idproduct}">
                <img src="http://placehold.it/350x250" class="img-rounded product-image" />
                <span class="product-list-name"><strong>{$product.name}</strong> <small class="label label-default">#{$product.code}</small></span>
                <span class="price-tag pull-right">&euro;{$product.price}</span>
            </a>
            <div class="col-xs-1">
                <a href="{$BASE_URL}actions/remove-from-cart.php?id={$product.idproduct}" class="remove-item-btn"aria-label="close">&times;</a>
                <button>{$product.quantity}</button>
            </div>
        </article>
    {/foreach}
</div>

<script src="{$BASE_URL}js/smart.min.js"></script>
<script src="{$BASE_URL}js/products.js"></script>
{/block}
