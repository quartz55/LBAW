{extends 'common/layout.tpl'}

{block name=content}
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
            <a class="nav-link" href="#">Purchase History</a>
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
    <spa class="label label-danger">TODO</spa>
</aside>

{/block}
