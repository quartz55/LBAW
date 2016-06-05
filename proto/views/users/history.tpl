{extends 'common/layout.tpl'}

{block name=content}
<link rel="stylesheet" href="{$BASE_URL}css/history.css">

{include file='common/left-panel.tpl' grid_opt='col-md-2 col-sm-12 text-xs-center text-sm-left'}

<div class="col-sm-12 col-md-10 main-content">
    <h3>Purchase History</h3>

    {if count($purchases) == 0}
            <h4 class="text-muted">You have no previous purchases</h4>
    {/if\}

    {$currDate = null}
    {foreach $purchases as $purchase}
        {if $currDate != $purchase['date']|date_format}
            {if $currDate != null}
                </div>
            {/if}
            <div class="date-group">
            {$currDate = $purchase['date']|date_format}
            <h4 class="text-muted">{$purchase['date']|date_format}</h4>
        {/if}
        <a href="{$BASE_URL}pages/products/product.php?id={$purchase['idproduct']}" class="purchase-link">
            <div class="purchase">
                <span class="qty">&times{$purchase['quantity']}</span>
                <img class="img-rounded purchase-img" src="http://placehold.it/350x250"/>
                <span class="purchase-name">{$purchase['name']} <small class="label label-default">#{$purchase['code']}</small></span>
                <span class="price-tag">€{$purchase['rprice']}</span>
            </div>
        </a>
    {/foreach}
        </div>
</div>

{/block}
