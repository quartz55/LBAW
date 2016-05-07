{include file='common/head.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/login.css">

{include file='common/messages.tpl'}

<div class="container">
    <form class="form-signin" action="{$BASE_URL}actions/login.php" method="post">
      <h2 class="form-signin-heading">Login</h2>
      <input type="email" name="email" class="form-control" placeholder="Email address" required autofocus>
      <input type="password" name="pass" class="form-control" placeholder="Password" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
      <a href="{$BASE_URL}" class="btn btn-lg btn-primary btn-block">Back</a>
    </form>

  </div> <!-- /container -->

{include file='common/scripts.tpl'}
</body>
</html>
