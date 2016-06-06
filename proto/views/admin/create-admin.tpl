{extends file='admin/layout.tpl'}

{block name=content}
    <h1 class="page-header">Create Administrator</h1>

    <form action="{$BASE_URL}actions/admin/create-admin.php" method="POST">
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
                    <i class="fa fa-unlock-alt fa-fw"></i>
                </span>
                <input class="form-control" name="pass" type="password" placeholder="Password" required/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-check fa-fw"></i>
                </span>
                <input class="form-control" name="passconfirm" type="password" placeholder="Confirm Password" required/>
            </div>
        </fieldset>
        <button type="submit" class="btn btn-primary">Create</button>
        <a class="btn btn-secondary" href="{$BASE_URL}pages/admin/users.php">Cancel</a>
    </form>
{/block}

{block name=scripts}
{/block}
