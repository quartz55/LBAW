{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/products.css">

<script>
 var BASE_URL = "{$BASE_URL}";
 function getProductURL(id) {
     return "{$BASE_URL}pages/product.php?id="+id;
 }
</script>

<aside class="col-sm-2 left-panel">
    {if $USERNAME}
        {include file='common/user-panel.tpl'}
    {else}
        {include file='common/guest-panel.tpl'}
    {/if}
</aside>

<div class="col-sm-8 main-content">
    <div class="row">
        <span class="col-xs-12">
            <h3>Products List</h3>
        </span>
    </div>

    {foreach $products as $product}
        <article class="product row"
                 onclick="window.location.href=getProductURL({$product.idproduct});">
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
        </article>
    {/foreach}
</div>

<aside class="col-sm-2 right-panel">
    <h3>Search</h3>
    <div class="input-group">
        <input id="search-input" class="form-control" type="text" placeholder="Search..."/>
        <span class="input-group-btn">
            <button id="search-btn" class="btn btn-secondary" type="button">
                <i class="fa fa-search"></i>
            </button>
        </span>
    </div>
</aside>


{include file='common/footer.tpl'}

<script src="{$BASE_URL}js/products.js">
</script>
