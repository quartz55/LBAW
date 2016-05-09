<article class="product row">
    <a href="{$BASE_URL}pages/products/product.php?id={$product.idproduct}">
        <span class="col-xs-12">
            <h5 class="product-list-name">{$product.name}</h5>
            <span class="price-tag">&euro;{$product.price}</span>
        </span>
        <div class="col-sm-3">
            <img src="http://placehold.it/350x250" class="img-fluid img-rounded product-image" />
        </div>
        <div class="col-sm-9 product-list-description">
            <b>#{$product.code}</b>
            <br/>
            {$product.description}
        </div>
    </a>
</article>
