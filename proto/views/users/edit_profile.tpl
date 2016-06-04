{extends 'common/layout.tpl'}

{block name=content}
<div class="col-xs-12 main-content">
    <h3>Edit Profile</h3>
    <form action="{$BASE_URL}actions/edit_profile.php" method="POST">
        <fieldset class="form-group">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-envelope fa-fw"></i>
                </span>
                <input class="form-control" type="text" value="{$client.email}" disabled/>
            </div>
        </fieldset>

        <fieldset class="form-group">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-user fa-fw"></i>
                </span>
                <input class="form-control" name="username" type="text" value="{$client.name}" placeholder="Username" required/>
            </div>
        </fieldset>

        <fieldset class="form-group">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-map-marker fa-fw"></i>
                </span>
                <input class="form-control" name="address" type="text" value="{$client.address}" placeholder="Address" required/>
            </div>
        </fieldset>

        <fieldset class="form-group">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-unlock-alt fa-fw"></i>
                </span>
                <input class="form-control" name="newpass" type="password" placeholder="New Password"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-check fa-fw"></i>
                </span>
                <input class="form-control" name="newpassconfirm" type="password" placeholder="Confirm New Password"/>
            </div>
            <small class="text-muted">Leave empty if you don't want to change password</small>
        </fieldset>
        <button type="submit" class="btn btn-primary">Confirm</button>
        <a class="btn btn-secondary" href="{$BASE_URL}pages/users/profile.php">Cancel</a>
    </form>
</div>
{/block}
