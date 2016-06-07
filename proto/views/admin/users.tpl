{extends file='admin/layout.tpl'}

{block name=content}

    <!-- DataTables CSS -->
    <link href="{$BASE_URL}bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="{$BASE_URL}bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <link href="{$BASE_URL}css/users.css" rel="stylesheet"/>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">User Administration</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <!-- ADMINS -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    Admins ({$admins|@count})
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="text-center col-xs-1">Options</th>
                                    <th>Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $admins as $admin}
                                    <tr>
                                        <td class="text-center col-xs-1" style="vertical-align: middle">
                                            <form class="form-inline" method="POST" action="{$BASE_URL}actions/admin/ban-user.php">
                                                <a class="opt-btn" href="{$BASE_URL}pages/admin/edit-admin.php?id={$admin['idperson']}" data-toggle="tooltip" title="Edit">
                                                    <i class="fa fa-pencil-square-o"></i>
                                                </a>
                                                <input name="id" type="hidden" value="{$admin['idperson']}"/>
                                                {if $admin['name'] !== $smarty.session.adminname}
                                                    <button class="opt-btn" type="submit" data-toggle="tooltip" title="Remove" onclick="return confirm('Are you sure you want to remove {$admin.name}?');">
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                {/if}
                                            </form>
                                        </td>
                                        <td>{$admin['name']}</td>
                                    </tr>
                                {/foreach}
                                <tr>
                                    <td class="text-center col-xs-1" style="vertical-align: middle">
                                        <a class="opt-btn" href="{$BASE_URL}pages/admin/create-admin.php" data-toggle="tooltip" title="Create Admin">
                                            <i class="fa fa-plus"></i>
                                        </a>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- END ADMINS -->
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <!-- CLIENTS -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    Clients ({$clients|@count})
                </div>
                <div class="panel-body">
                    <div class="dataTable_wrapper">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover dt">
                                <thead>
                                    <tr>
                                        <th class="text-center col-xs-1">Options</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Address</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $clients as $client}
                                        <tr>
                                            <td class="text-center col-xs-1" style="vertical-align: middle">
                                                <form class="form-inline" method="POST" action="{$BASE_URL}actions/admin/ban-user.php">
                                                    <a class="opt-btn" href="{$BASE_URL}pages/admin/edit-client.php?id={$client['idperson']}" data-toggle="tooltip" title="Edit">
                                                        <i class="fa fa-pencil-square-o"></i>
                                                    </a>
                                                    <input name="id" type="hidden" value="{$client['idperson']}"/>
                                                    <button class="opt-btn" type="submit" data-toggle="tooltip" title="Ban" onclick="return confirm('Are you sure you want to ban {$client.name}?');">
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </form>
                                            </td>
                                            <td>{$client['name']}</td>
                                            <td>{$client['email']}</td>
                                            <td>{$client['address']}</td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CLIENTS -->
        </div>
    </div>
{/block}

{block name=scripts}
    <!-- DataTables JavaScript -->
    <script src="{$BASE_URL}bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="{$BASE_URL}bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <script>
     $(function () {
         $('[data-toggle="tooltip"]').tooltip();
         $('.dt').DataTable({
             responsive: true
         });
     });
    </script>
{/block}
