import 'package:trafficlly/utills/export.dart';

class AppConstants {
  static const String appName = 'TimePay';
  static const String appVersion = '1.0.0';

  static const String pleaseWait = 'please wait...';
  static const String signintext = "Login in to your account";
  static const String signintext2 =
      "Please enter your credentials to continue.";
  static const String rememberMe = 'Remember me';
  static const String forgotPassword = 'Forgot Password?';
  static const String dontHaveAccount = "Don't have an account?";
  static const String signUp = 'Sign Up';
  static const String orcontinuewith = 'or continue with';
  static const String signIn = 'Sign In';
  static const String signUpText = 'Sign Up to your account';
  static const String signUpText2 =
      'Please enter your credentials to continue.';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String signInText = 'Sign In';
  static const String orSignUpWith = 'or Sign Up with';
  static const String createpassword = 'Create a new password 🔑';
  static const String createpassword2 =
      'Please enter a new and strong password that will secure your account';
  static const String newpassword = 'New Password';
  static const String otpText =
      'Please enter the OTP code that has been sent to your phone or email.';
  static const String resendOtp = 'Resend OTP in: ';
  static const String otpFields = 'OTP Fields';
  static const String verifyOtp = 'Verify OTP';
  static const String resend = 'Resend';
  static const String otpVerification = 'OTP Code Verification 🔑';
  static const String otpVerificationText =
      'Please enter the OTP code that has been sent to your phone or email.';
  static const String termsAccepted = "I accept the terms & conditions";
  static const String already = "Already have an account? ";
  static const String trafficsummary = "Traffic Summary ";
  static const String trafficanalysis = "Traffic Analysis ";
  static const String drivingLicences = "Driving Licences ";

  // API Endpointster
  static const String baseUrl = 'https://api.timepay.com';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String userProfileEndpoint = '/user/profile';

  // Timeout durations
  static const Duration apiTimeout = Duration(seconds: 30);

  // UI constants
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double defaultBorderRadius = 8.0;

  // Colors
  static const int primaryColor = 0xFF0A0E21;
  static const int accentColor = 0xFFEB1555;
  static const int backgroundColor = 0xFFFFFFFF;

  // Fonts
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Montserrat';
}
