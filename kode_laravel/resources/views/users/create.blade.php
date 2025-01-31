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
        <div class="row w-100 m-0">
          <div class="content-wrapper full-page-wrapper d-flex align-items-center auth login-bg">
            <div class="card col-lg-4 mx-auto">
              <div class="card-body px-5 py-5">
                <h3 class="card-title text-left mb-3">Register</h3>
                <form method="POST" action="{{ route('users.store') }}">
                    @csrf
                  <div class="form-group">
                    <label for="name">Nama</label>
                    <input type="text" class="form-control p_input"  name="name" id="name" value="{{ old('name') }}" required autofocus>
                    @error('name')
                        <span role="alert">{{ $message }}</span>
                    @enderror
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control p_input" name="email" id="email" value="{{ old('email') }}" required>
                    @error('email')
                        <span role="alert">{{ $message }}</span>
                    @enderror
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control p_input" name="password" id="password" required>
                    @error('password')
                        <span role="alert">{{ $message }}</span>
                    @enderror
                  </div>
                  <div class="form-group">
                    <label for="password_confirmation">Konfigurasi Password</label>
                    <input type="password" class="form-control p_input" name="password_confirmation" id="password_confirmation" required>
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-block enter-btn">Save</button>
                  </div>
                  <p class="sign-up text-center">Already have an Account?<a href="#"> Sign Up</a></p>
                  <p class="terms">By creating an account you are accepting our<a href="#"> Terms & Conditions</a></p>
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