{include file='common/head.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/login.css">

{include file='common/messages.tpl'}

<div class="container">
    <form class="form-signin" action="{$BASE_URL}actions/adminlogin.php" method="post">
        <h2 class="form-signin-heading">Admin Authentication</h2>
        <input type="text" name="adminname" class="form-control" placeholder="Admin name" required autofocus>
        <input type="password" name="pass" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Authenticate</button>
        <a href="{$BASE_URL}" class="btn btn-lg btn-primary btn-block">Back</a>
    </form>

</div> <!-- /container -->

{include file='common/scripts.tpl'}
</body>
</html>
