<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Corona Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="{{ asset('Assets/assets/vendors/mdi/css/materialdesignicons.min.css') }}">
    <link rel="stylesheet" href="{{ asset('Assets/assets/vendors/css/vendor.bundle.base.css') }}">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="{{ asset('Assets/assets/css/style.css') }}">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="{{ asset('Assets/assets/images/favicon.png') }}" />
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
      @if($message = Session::get('success'))
                  <div class="alert alert-success">
                    <p>{{ $message }}</p>
                  </div>
                @endif
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Login</h3>
                <form class="user" method="POST" action="/login">
                    @csrf
                  <div class="form-group">
                    <label>Email *</label>
                    <input type="email" name="email" class="form-control p_input" required>
                  </div>
                  <div class="form-group">
                    <label>Password *</label>
                    <input type="password" name="password" class="form-control p_input" required>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-block enter-btn">Login</button>
                  </div>
                  <p class="sign-up">Don't have an Account?<a href="{{('/users/create')}}"> Sign Up</a></p>
                </form>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
        </div>
        <!-- row ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="{{ asset('Assets/assets/vendors/js/vendor.bundle.base.js') }}"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="{{ asset('Assets/assets/js/off-canvas.js') }}"></script>
    <script src="{{ asset('Assets/assets/js/hoverable-collapse.js') }}"></script>
    <script src="{{ asset('Assets/assets/js/misc.js') }}"></script>
    <script src="{{ asset('Assets/assets/js/settings.js') }}"></script>
    <script src="{{ asset('Assets/assets/js/todolist.js') }}"></script>
    <!-- endinject -->
  </body>
</html>