<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.php">
        <span><i class="fa fa-car"></i>Car Rental</span>
      </a>
      <?php if (isset($_SESSION['username'])) : ?>
        <a class="navbar-brand" href="logout.php">
          <span>Logout</span>
        </a>
      <?php endif ?>
      <?php if (!isset($_SESSION['username'])) : ?>
        <a class="navbar-brand" href="login-form.php">
          <span>Login</span>
        </a>
      <?php endif ?>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="office_list.php">Our Offices</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>