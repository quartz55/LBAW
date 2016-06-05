{extends 'common/layout.tpl'}

{block name=content}
<link rel="stylesheet" href="{$BASE_URL}css/shoppingcart.css">

{include file='common/left-panel.tpl' grid_opt='col-sm-2 text-xs-center'}

<div class="col-sm-10 main-content">
    <h3>Shopping Cart <span id="num-products" class="text-muted">({count($products)} product{if count($products) != 1}s{/if})</span></h3>

    <div class="container">
        {foreach $products as $product}
            <article class="product row">
                <a class="col-xs-10 product-link" href="{$BASE_URL}pages/products/product.php?id={$product.idproduct}">
                    <img src="http://placehold.it/350x250" class="img-rounded product-image" />
                    <span class="product-list-name"><strong>{$product.name}</strong> <small class="label label-default">#{$product.code}</small></span>
                    <span class="price-tag pull-right">&euro;{$product.price}</span>
                </a>
                <form action="{$BASE_URL}actions/add-to-cart.php"class="form-inline col-xs-2" method="POST">
                    <input name="noadd" type="hidden""/>
                    <input name="id" type="hidden" value="{$product['idproduct']}"/>
                    <input class="prod-qty form-control" type="number" min="1" max="{$product.stock + $product.quantity}" step="1" value="{$product.quantity}" name="quantity" required/>
                    <a href="{$BASE_URL}actions/remove-from-cart.php?id={$product.idproduct}" class="remove-item-btn" aria-label="close">&times;</a>
                </form>
            </article>
        {/foreach}
        {if count($products) > 0}
            <div class="cart-toolbar row">
                <a class="checkout-btn btn btn-success" href="{$BASE_URL}actions/checkout.php" onclick="return confirm('Proceed with checkout?');" >Checkout</a>
                <a class="clearcart-btn btn btn-danger" href="{$BASE_URL}actions/clear-cart.php" onclick="return confirm('Are you sure you want to clear your cart?');">Clear</a>
            </div>
        {else}
            <h4 class="text-muted">You have no products in the shopping cart</h4>
        {/if}
    </div>
</div>
{/block}
