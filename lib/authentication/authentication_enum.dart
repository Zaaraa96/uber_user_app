
enum AuthenticationMode {
  signUp,
  login;

  String getButtonText() {
    switch (this) {
      case AuthenticationMode.signUp:
        return 'sign up';
      case AuthenticationMode.login:
        return 'login';
    }
  }
  String getScreenText() {
    switch (this) {
      case AuthenticationMode.signUp:
        return 'Create a User\'s Account';
      case AuthenticationMode.login:
        return 'Login to User\'s Account';
    }
  }

  String getMoreButtonText() {
    switch (this) {
      case AuthenticationMode.signUp:
        return 'already have an account? login here';
      case AuthenticationMode.login:
        return 'don\'t have an account? sign up here';
    }
  }

  AuthenticationMode changeMode(){
    switch (this) {
      case AuthenticationMode.signUp:
        return AuthenticationMode.login;
      case AuthenticationMode.login:
        return AuthenticationMode.signUp;
    }
  }

  bool showName(){
     return this == AuthenticationMode.signUp;
  }

}