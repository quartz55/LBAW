{function name=stars}
{math equation="floor(x)" x=$rating assign=full_stars}
{math equation="ceil(x - floor(x))" x=$rating y=$rating assign=half_stars}
{math equation="5 - ceil(x)" x=$rating assign=empty_stars}

{for $i=1 to $full_stars}
    <i class="fa fa-star"></i>
{/for}
{for $i=1 to $half_stars}
    <i class="fa fa-star-half-o"></i>
{/for}
{for $i=1 to $empty_stars}
    <i class="fa fa-star-o"></i>
{/for}
{/function}

<article class="product row">
    <a class="product-link" href="{$BASE_URL}pages/products/product.php?id={$product.idproduct}">
        <div class="col-xs-12 product-wrapper">
            <div class="col-xs-12 product-list-header">
                <span class="product-list-name">{$product.name} <small class="label label-default">#{$product.code}</small></span>
                {$price = getProductPrice($product)}
                {$discount = price != $product['price']}
                {if $discount}
                    <small class="pull-right discount-ammount">-{$product['discount']}%</small>
                {/if}
                <span class="price-tag pull-right">&euro;{$price}</span>
            </div>
            <div class="col-sm-3">
                <img src="http://placehold.it/350x250" class="img-fluid img-rounded product-image" />
            </div>
            <div class="col-sm-9 product-list-description">
                <div class="product-list-rating">
                    {call stars rating=$product.rating}
                </div>
                {$product.description}
            </div>
        </div>
    </a>
</article>
