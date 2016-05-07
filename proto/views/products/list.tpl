{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/products.css">


<script>
 var BASE_URL = {$BASE_URL}+"";
 function getProductURL(id) {
     return "{$BASE_URL}pages/product.php?id="+id;
 }
</script>

<div class="col-sm-8 main-content">
    <div class="row">
        <span class="col-xs-12">
            <h3>Products List</h3>
            <hr>
        </span>
    </div>

    {foreach $products as $product}
        <article class="product row"
                 onclick="window.location.href=getProductURL({$product.idproduct});">
            <span class="col-xs-12">
                <h5 class="product-list-name">{$product.name}</h5>
                <span class="price-tag">&euro;{$product.price}</span>
            </span>
            <hr/>
            <div class="col-sm-3"><img src="http://placehold.it/350x250" class="img-responsive img-rounded product-image" /></div>
            <div class="col-sm-9 product-list-description">
                <p><b>#{$product.code}</b></p>
                <p>{$product.description}</p>
            </div>
        </article>
    {/foreach}
</div>

<aside class="col-sm-2 right-panel">
    <h3>Search</h3>
    <hr>
    <div class="input-group">
        <input id="search-input" class="form-control input-lg" type="text" placeholder="Search..." style="font-size: 14px;"/>
        <span class="input-group-btn">
            <button id="search-btn" class="btn btn-info btn-lg" type="button">
                <i class="glyphicon glyphicon-search"></i>
            </button>
        </span>
    </div>
</aside>


{include file='common/footer.tpl'}

<script src="{$BASE_URL}js/products.js">
</script>
