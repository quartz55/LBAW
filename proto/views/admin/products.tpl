{extends file='admin/layout.tpl'}

{block name=content}

    <!-- DataTables CSS -->
    <link href="{$BASE_URL}bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="{$BASE_URL}bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <link href="{$BASE_URL}css/users.css" rel="stylesheet"/>

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Product Administration</h1>
        </div>
    </div>

    <!-- PRODUCTS -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Products ({$products|@count})
                </div>
                <div class="panel-body">
                    <div class="dataTable_wrapper">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover dt">
                                <thead>
                                    <tr>
                                        <th class="text-center col-xs-1">Options</th>
                                        <th>Code</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Featured</th>
                                        <th>Discount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $products as $product}
                                        <tr>
                                            <td class="text-center col-xs-1" style="vertical-align: middle">
                                                <form class="form-inline" method="POST" action="{$BASE_URL}actions/admin/remove-product.php">
                                                    <a class="opt-btn" href="{$BASE_URL}pages/admin/edit-product.php?id={$product['idproduct']}" data-toggle="tooltip" title="Edit">
                                                        <i class="fa fa-pencil-square-o"></i>
                                                    </a>
                                                    <input name="id" type="hidden" value="{$product['idproduct']}"/>
                                                    <button class="opt-btn" type="submit" data-toggle="tooltip" title="Remove" onclick="return confirm('Are you sure you want to remove {$product.name}?');">
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </form>
                                            </td>
                                            <td>{$product['code']}</td>
                                            <td>{$product['name']}</td>
                                            <td>{$product['price']}</td>
                                            <td>
                                                {if $product['featured']}
                                                    <i class="fa fa-check text-success"></i>
                                                {/if}
                                            </td>
                                            <td>{$product['discount']}</td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END PRODUCTS -->
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
