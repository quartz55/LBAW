{include file='common/head.tpl'}

{include file='common/messages.tpl'}

<div class="container site-wrapper">

    <header class="navbar row">
        <a class="navbar-brand title-btn" href="{$BASE_URL}index.php">Online Shop</a>
        <ul class="nav navbar-nav pull-xs-right">
            <li class="nav-item">
                <span class="btn btn-secondary shopping-cart">
                    <i class="fa fa-shopping-cart fa-fw"></i>
                    <span class="cart-num-items">0</span> Items in cart
                </span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$BASE_URL}index.php">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$BASE_URL}pages/products/products.php">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$BASE_URL}pages/contact.php">Contact</a>
            </li>
        </ul>
    </header>

    <main class="row">
