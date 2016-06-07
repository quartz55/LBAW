{extends 'common/layout.tpl'}

{block name=content}

    <link href="{$BASE_URL}css/profile.css" rel="stylesheet"/>

    <div class="col-sm-8 main-content">
        <h3>{$USERNAME} Profile</h3>
        <ul class="list-group">
            <li class="list-group-item"><strong>Email: </strong>{$client.email}</li>
            <li class="list-group-item"><strong>Address: </strong>{$client.address}</li>
        </ul>
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link" href="#">Wishlist</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$BASE_URL}pages/users/history.php">Purchase History</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$BASE_URL}pages/users/edit_profile.php">Edit Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$BASE_URL}actions/logout.php">Logout</a>
            </li>
        </ul>
    </div>

    <aside class="col-sm-4 right-panel">
        <h3>Recent Purchases</h3>
        {foreach $recent as $purchase}
            <a href="{$BASE_URL}pages/products/product.php?id={$purchase['idproduct']}" class="product-card-link">
                <div class="card product-card text-xs-center">
                    <div class="card-block">
                        <h4 class="card-title">{$purchase.name}</h4>
                        <span class="price-tag">€{$purchase['rprice']}</span>
                    </div>
                </div>
            </a>
        {/foreach}
    </aside>

{/block}
