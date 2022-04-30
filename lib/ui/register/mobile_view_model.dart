import 'package:shared_preferences/shared_preferences.dart';
// import 'package:country_code_picker/country_code.dart';
import '/ui/create_user/create_user_screen.dart';
import 'package:image_picker/image_picker.dart';
import '/ui/otp_verify/otp_verify_screen.dart';
import '/ui/add_photo/add_photo_screen.dart';
import '/model/login_with_otp_model.dart';
import '/ui/welcome/welcome_screen.dart';
import '/ui/register/mobile_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '/ui/gender/gender_screen.dart';
import '/model/user_exist_model.dart';
import 'package:stacked/stacked.dart';
import '/model/register_model.dart';
import '/model/gender_model.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class MobileViewModel extends BaseViewModel {
  String countryCode = "+91";

  //add photo
  File? imageFile = File("");

  //Mobile Screen
  TextEditingController mobileNumber = TextEditingController();
  bool _showPassword = false;

  bool get showPassword => _showPassword;

  //  OTP Verify Screen
  late TextEditingController otpController = TextEditingController();
  late TextEditingController locationController = TextEditingController();
  String otpSet = "";

  //send_otp_mobile Model
  LoginWithOtpModel loginWithOtpModel = LoginWithOtpModel();

  // Create User Screens
  late TextEditingController firstName = TextEditingController();
  late TextEditingController lastName = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();

  int currentIndex = 1;
  DateTime? datePicked;
  String selectedGender = "";
  List<GenderModel> listGender = [];

  init(BuildContext context) async {
    //Mobile Screen
    mobileNumber.addListener(() => notifyListeners());
    locationController.addListener(() => notifyListeners());

    // Create User Screens
    firstName.addListener(() => notifyListeners());
    lastName.addListener(() => notifyListeners());
    password.addListener(() => notifyListeners());
    confirmPassword.addListener(() => notifyListeners());

    //gender List
    listGender = [
      GenderModel(false, "Male"),
      GenderModel(false, "Female"),
      GenderModel(false, "Non-binary"),
      GenderModel(false, "Rather not say"),
    ];
  }

  // Validation Mobile Screen Data
  validation(BuildContext context) {
    if (mobileNumber.text.isEmpty || mobileNumber.text.length != 10) {
      flutterToast("Number is not valid !!", Colors.redAccent);
    } else {
      Future.delayed(const Duration(microseconds: 500),
          () => checkUserExist(context, mobileNumber.text));
    }
  }

  //show Password
  togglePassVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  bool _showConfirmPassword = false;

  bool get showConfirmPassword => _showConfirmPassword;

  //show Confirm Password
  void toggleConfirmPassVisibility() {
    _showConfirmPassword = !_showConfirmPassword;
    notifyListeners();
  }

  // Select County Code
  // void onCountryChange(CountryCode countryCode) {
  //   // this.countryCode = countryCode.toString();
  //   // notifyListeners();
  //   // print("New Country selected: " + countryCode.toString());
  // }

  // Send OTP
  sendOtp(BuildContext context) async {
    Map<String, String> params = {
      'mobile': mobileNumber.text,
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse("https://api.cynthians.com/index.php/api/send_otp_mobile"),
          body: params);
      if (response.statusCode == 200) {
        loginWithOtpModel =
            LoginWithOtpModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        print("otp -------- ${loginWithOtpModel.otp}");
        otpSet = "${loginWithOtpModel.otp}";
        notifyListeners();
        AppRoutes.dismiss(context);
        if (loginWithOtpModel.message == "OTP sent successfully.") {
          flutterToast(loginWithOtpModel.message, Colors.green);
          currentIndex = 2;
          notifyListeners();
          reset();
          startTimer();
        } else {
          flutterToast(loginWithOtpModel.message, Colors.redAccent);
        }
      } else {
        throw Exception('Exception in Login With OTP API');
      }
    } catch (e) {
      Exception("Exception in loginWithOTP API ----- $e");
    }
  }

  // Timer Functionality on OTP Verify Screen
  static const countdownDuration = Duration(seconds: 60);
  Duration duration = const Duration();
  Timer? timer;
  bool countDown = true;

  void reset() {
    if (countDown) {
      duration = countdownDuration;
      notifyListeners();
    } else {
      duration = const Duration();
      notifyListeners();
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    notifyListeners();
    final seconds = duration.inSeconds + addSeconds;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
    notifyListeners();
  }

  // Verify OTP
  otpVerify(BuildContext context) {
    if (otpController.text == otpSet) {
      currentIndex = 3;
      notifyListeners();
    } else {
      flutterToast("Wrong OTP !!!", Colors.redAccent);
    }
  }

  // Check User
  checkUserExist(BuildContext context, String mobileNumber) async {
    Map<String, String> params = {
      'mobile': mobileNumber,
    };
    showLoadingDialog(context);
    try {
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/check_newmobile_studlogin"),
          body: params);
      if (response.statusCode == 200) {
        UserExistModel userExistModel =
            UserExistModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        if (userExistModel.loginType == 'exist') {
          //already exist
          flutterToast("Already Registered !!!", Colors.redAccent);
          AppRoutes.dismiss(context);
        } else {
          AppRoutes.dismiss(context);
          Future.delayed(
              const Duration(microseconds: 500), () => sendOtp(context));
          currentIndex = 1;
        }
      }
    } catch (e) {
      Exception("Exception in checkUserExist API --- $e");
    }
  }

  // Register Screen
  Widget registerFlow() {
    return currentIndex == 1
        ? MobileScreen(viewModel: this)
        : currentIndex == 2
            ? OtpVerifyScreen(otp: otpSet, viewModel: this)
            : currentIndex == 3
                ? CreateUserScreen(viewModel: this)
                : currentIndex == 4
                    ? GenderScreen(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        password: password.text,
                        mobile: countryCode + mobileNumber.text,
                        viewModel: this,
                      )
                    : currentIndex == 5
                        ? AddPhotoScreen(
                            viewModel: this,
                            firstName: firstName.text,
                            lastName: lastName.text,
                            password: password.text,
                            datePicked: datePicked!,
                            gender: selectedGender,
                            mobile: countryCode + mobileNumber.text)
                        : Text("$currentIndex");
  }

  double getCompletionPercentage() {
    if (currentIndex == 0) {
      return 0;
    }
    return currentIndex / 5;
  }

  //genderScreen Model
  void genderScreen(BuildContext context) {
    if (firstName.text.isEmpty ||
        lastName.text.isEmpty ||
        password.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      flutterToast("Please enter valid data !! ", Colors.redAccent);
    } else {
      if (password.text == confirmPassword.text) {
        currentIndex = 4;
        notifyListeners();
      } else {
        flutterToast("Password does not match !!!", Colors.redAccent);
      }
    }
  }

  // Gender Screen
  updateGenderList(GenderModel gender) {
    listGender.map((e) {
      if (e == gender) {
        e.isSelected = true;
        selectedGender = "${e.title}";
        notifyListeners();
      } else {
        e.isSelected = false;
        notifyListeners();
      }
    }).toList();
  }

  // Move to Next Screen
  genderToNextScreen() {
    if (selectedGender.isEmpty || datePicked == null) {
      flutterToast("Please Select Gender/ Date", Colors.redAccent);
    } else {
      currentIndex = 5;
      notifyListeners();
    }
  }

  // Get Image From Gallery
  getFromGallery() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Get Image From Gallery
  getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  registerUser(BuildContext context) async {
    // Uint8List imageBytes = await imageFile!.readAsBytes();
    // String base64string = base64.encode(imageBytes);

    //File Name
    // String fileName = imageFile!.path.split('/').last.toString();

    // print("fileName ---- $fileName");

    Map<String, String> params = {
      'mobile': mobileNumber.text,
      'fname': firstName.text,
      'lname': lastName.text,
      'confirmPassword': password.text,
      'source_id': '1',
      'student_dob': datePicked.toString().substring(0, 10),
      'gender': selectedGender,
      'city': locationController.text,
      'state': "state",
      'profilepic': '${imageFile.toString().replaceAll("File: ", "")}',
      // 'file_name': fileName,
    };
    print("params ------- ${params}");
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse("https://institute.cynthians.com/signup/savenewpassword"),
          body: params);
      if (response.statusCode == 200) {
        RegisterModel registerModel =
            RegisterModel.fromJson(jsonDecode(response.body));

        if (registerModel.message == 'Password saved successfully') {
          flutterToast(registerModel.message, Colors.green);
          AppRoutes.dismiss(context);
          AppRoutes.goto(context,
              WelcomeScreen(name: firstName.text, imageFile: imageFile!));
        } else {
          flutterToast(registerModel.message, Colors.redAccent);
        }
      }
    } catch (e) {
      flutterToast("Something went wrong !!!", Colors.redAccent);
      print("Exception in Login API $e");
    }
  }

  getAndSaveToken(BuildContext context, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("Shared Preference Token ------ ${prefs.getString("token")}");
  }

  @override
  void dispose() {
    mobileNumber.dispose();
    firstName.dispose();
    otpController.dispose();
    lastName.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
}
