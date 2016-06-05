{extends 'common/layout.tpl'}

{block name=content}
<link rel="stylesheet" href="{$BASE_URL}css/products.css">

<script>
 var BASE_URL = "{$BASE_URL}";
</script>

{include file='common/left-panel.tpl' grid_opt='col-md-2 col-sm-4 text-xs-center'}

<aside class="col-sm-8 col-md-2 col-md-push-8 right-panel">
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

<div class="col-sm-12 col-md-8 col-md-pull-2 main-content">
    <h3>Products List <span id="num-products" class="text-muted">(Showing {$products|@count} products)</span></h3>

    {foreach $products as $product}
        {include file='products/product-listing.tpl' product=$product}
    {/foreach}
</div>

{/block}

{block name=scripts}
    <script src="{$BASE_URL}js/smart.min.js"></script>
    <script src="{$BASE_URL}js/products.js"></script>
{/block}
