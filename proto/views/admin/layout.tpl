<!DOCTYPE html>
<html>

<head>
    <title>Online Shop</title>
    <meta charset='utf-8'>

    <link rel="stylesheet" href="{$BASE_URL}css/font-awesome.min.css">
</head>

<link href="{$BASE_URL}css/control-panel.css" rel="stylesheet" />

<!-- Bootstrap Core CSS -->
<link href="{$BASE_URL}bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="{$BASE_URL}bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="{$BASE_URL}css/sb-admin-2.css" rel="stylesheet">

<body>

    {include file='common/messages.tpl'}

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Control Panel v0.12</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="{$BASE_URL}actions/logout.php"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="{$BASE_URL}pages/admin/control-panel.php"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="{$BASE_URL}pages/admin/users.php"><i class="fa fa-table fa-fw"></i> Users</a>
                        </li>
                        <li>
                            <a href="{$BASE_URL}pages/admin/products.php"><i class="fa fa-table fa-fw"></i> Products</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        {block name=content} {/block}
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    {include file='common/scripts.tpl'}

    <!-- Metis Menu Plugin JavaScript -->
    <script src="{$BASE_URL}bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="{$BASE_URL}js/sb-admin-2.js"></script>

    {block name=scripts}{/block}
</body>

</html>
