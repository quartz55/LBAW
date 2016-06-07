{extends file='admin/layout.tpl'}

{block name=content}
    <h1 class="page-header">Edit Administrator</h1>

    <form action="{$BASE_URL}actions/admin/edit-admin.php" method="POST">
        <input name="id" type="hidden" value="{$admin['idperson']}"/>

        <fieldset class="form-group">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-user fa-fw"></i>
                </span>
                <input class="form-control" name="username" type="text" value="{$admin['name']}" placeholder="Username" required/>
            </div>
        </fieldset>

        <fieldset class="form-group">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-unlock-alt fa-fw"></i>
                </span>
                <input class="form-control" name="pass" type="password" placeholder="New Password" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-check fa-fw"></i>
                </span>
                <input class="form-control" name="passconfirm" type="password" placeholder="Confirm New Password" />
            </div>
            <small class="text-muted">Leave empty if you don't want to change password</small>
        </fieldset>
        <button type="submit" class="btn btn-primary">Edit</button>
        <a class="btn btn-secondary" href="{$BASE_URL}pages/admin/users.php">Cancel</a>
    </form>
{/block}

{block name=scripts}
{/block}
