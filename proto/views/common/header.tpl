{include file='common/head.tpl'}

{include file='common/messages.tpl'}

<div class="container site-wrapper">
  <header class="row">
    <div class="col-sm-4">
      <a href="{$BASE_URL}pages/home.php" class="title-btn">Online Shop</a>
    </div>
    <nav class="col-sm-8 navbar navbar-default">
      <div class="container-fluid">
        <ul class="nav nav-pills navbar-right site-nav">
          <li><span class="btn btn-default shopping-cart"><span class="glyphicon glyphicon-shopping-cart"></span><span class="cart-num-items">0</span> Items in cart</span>
          </li>
          <li><a href="{$BASE_URL}pages/home.php"> Home </a></li>
          <li><a href="{$BASE_URL}pages/products/products.php"> Products </a></li>
          <li><a href="{$BASE_URL}pages/contact.php"> Contact </a></li>
        </ul>
      </div>
    </nav>
  </header>

  <main class="row">

    <aside class="col-sm-2 left-panel">
      {if $USERNAME}
      {include file='common/user-panel.tpl'}
      {else}
      {include file='common/guest-panel.tpl'}
      {/if}
    </aside>
