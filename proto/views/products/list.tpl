{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/products.css">

<script>
 function getProductURL(id) {
     return "{$BASE_URL}pages/product.php?id="+id;
 }
</script>

<aside class="col-sm-2 left-panel">
</aside>
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
    <div class="search row">
        <span class="col-xs-12">
            <h3>Search</h3>
            <hr>
        </span>
        <div class="form-group">
            <span class="col-xs-8"><input type="text" id="searchInput" placeholder="Type here..." class="form-control"></span><span class="col-xs-4"><button type="submit" class="btn btn-default glyphicon glyphicon-search"></button></span>
        </div>
        <form class="form-horizontal search-form">
        </form>
    </div>
</aside>

{include file='common/footer.tpl'}
