{extends file='admin/layout.tpl'}

{block name=content}
    <h1 class="page-header">Edit User</h1>

    <form action="{$BASE_URL}actions/admin/edit-client.php" method="POST">
        <input name="id" type="hidden" value="{$client['idperson']}"/>

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
                <input class="form-control" name="username" type="text" value="{$client['name']}" placeholder="Username" required/>
            </div>
        </fieldset>

        <fieldset class="form-group">
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-map-marker fa-fw"></i>
                </span>
                <input class="form-control" name="address" type="text" value="{$client['address']}" placeholder="Address" required/>
            </div>
        </fieldset>

        <button type="submit" class="btn btn-primary">Edit</button>
        <a class="btn btn-secondary" href="{$BASE_URL}pages/admin/users.php">Cancel</a>
    </form>
{/block}

{block name=scripts}
{/block}
