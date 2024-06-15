class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException({required this.code});

  String get errorMessage {
    switch (code) {
      case "email-already-in-use":
        return "The email address is already in use by another account.";
      case "invalid-email":
        return "The email address is badly formatted.";
      case "operation-not-allowed":
        return "Email & Password accounts are not enabled.";
      case "weak-password":
        return "The password is too weak.";
      case "user-not-found":
        return "There is no user record corresponding to this identifier. The user may have been deleted.";
      case "wrong-password":
        return "The password is invalid or the user does not have a password.";
      case "user-disabled":
        return "The user account has been disabled by an administrator.";
      case "too-many-requests":
        return "We have blocked all requests from this device due to unusual activity. Try again later.";
      case "network-request-failed":
        return "A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
      case "quota-exceeded":
        return "Quota exceeded, please try again later.";
      case "missing-verification-code":
        return "The phone auth credential was created with an empty SMS verification code.";
      case "missing-verification-id":
        return "The phone auth credential was created with an empty verification ID.";
      case "captcha-check-failed":
        return "The reCAPTCHA response token provided is either invalid, expired, already used or the domain associated with it does not match the list of whitelisted domains.";
      case "app-not-authorized":
        return "The app is not authorized to use Firebase Authentication with the provided API key.";
      case "key-pair-not-found":
        return "The public key certificate used to generate this token is not found.";
      case "internal-error":
        return "An internal error has occurred.";
      case "invalid-credential":
        return "The supplied auth credential is malformed or has expired.";
      case "invalid-verification-code":
        return "The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.";
      case "invalid-verification-id":
        return "The verification ID used to create the phone auth credential is invalid.";
      case "session-expired":
        return "The sms code has expired. Please re-send the verification code to try again.";
      case "email-already-exists":
        return "An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";
      case "provider-already-linked":
        return "This credential is already associated with a different user account.";
      case "credential-already-in-use":
        return "This credential is already associated with a different user account.";
      case "required-recent-login":
        return "The user's last sign-in time does not meet the security threshold. Please prompt the user to sign in again.";
      case "user-mismatch":
        return "The supplied credentials do not correspond to the previously signed in user.";
      case "account-exists-with-different-credential":
        return "An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";
      case "expired-action-code":
        return "The action code has expired.";
      case "invalid-action-code":
        return "The action code is invalid. This can happen if the code is malformed, expired, or has already been used.";
      case "invalid-email-verified":
        return "The email is already verified.";
      
      default:
        return "An error occurred while processing the request.";
    }
  }
}
