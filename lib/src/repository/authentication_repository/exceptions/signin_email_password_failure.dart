class SignInWithEmailAndPasswordFailure implements Exception {
  final String message;

  const SignInWithEmailAndPasswordFailure([this.message = "An unknown error occurred."]);

  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignInWithEmailAndPasswordFailure('Invalid email address.');
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure('This account has been disabled.');
      case 'user-not-found':
        return const SignInWithEmailAndPasswordFailure('Email address not found.');
      case 'wrong-password':
        return const SignInWithEmailAndPasswordFailure('Incorrect password.');
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }
}