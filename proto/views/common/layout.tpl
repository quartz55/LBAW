{include file='common/head.tpl'}

<body>
    {include file='common/messages.tpl'}

    <div class="container site-wrapper">

        <header class="navbar row">
            <a class="navbar-brand title-btn" href="{$BASE_URL}index.php">StreetWay Online</a>
            <ul class="nav navbar-nav pull-xs-right">
                {if $USERNAME}
                <li class="nav-item">
                    <a href="{$BASE_URL}pages/users/shoppingcart.php" class="btn btn-secondary shopping-cart">
                        <i class="fa fa-shopping-cart fa-fw"></i>
                        <span class="cart-num-items">{$CART_ITEMS}</span> Item{if $CART_ITEMS !== 1}s{/if} in cart
                    </a>
                </li>
                {/if}
                <li class="nav-item">
                    <a class="nav-link" href="{$BASE_URL}index.php">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$BASE_URL}pages/products/products.php">Products</a>
                </li>
            </ul>
        </header>

        <main class="row">
            {block name=content} {/block}
        </main>

        <footer class="row">
            <div class="col-xs-6">
                <span class="h5">LBAW</span>
            </div>
            <div class="col-xs-6">
                {if $smarty.session.adminname}
                    <a class="btn btn-default pull-right" href="{$BASE_URL}pages/admin/control-panel.php">Control Panel</a> {else}
                    <a class="btn btn-default pull-right" href="{$BASE_URL}pages/admin/login.php">Control Panel</a> {/if}
            </div>
        </footer>
    </div>
    {include file='common/scripts.tpl'} {block name=scripts} {/block}
</body>

</html>
