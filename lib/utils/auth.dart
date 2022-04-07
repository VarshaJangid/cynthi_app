// import '/model/user_details_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'app_constant.dart';
//
// final auth = Auth();
//
// class Auth {
//   UserDetails? _user;
//
//   UserDetails? get currentUser {
//     return _user;
//   }
//
//   Future<void> setUser(
//       {String? studentId,
//       String? firstName,
//       String? lastName,
//       String? mobileNo,
//       String? gender,
//       String? token}) async {
//     if (token != null) {
//       _user = UserDetails.fromEmail(
//           studentId!, firstName!, lastName!, mobileNo!, gender!, token);
//     }
//   }
//
//   Future<void> setUserFromPreference() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     _user = UserDetails();
//     _user!.studentId = prefs.getString(AuthConstants.studentID);
//     _user!.firstName = prefs.getString(AuthConstants.firstName) ?? "";
//     _user!.lastName = prefs.getString(AuthConstants.lastName) ?? "";
//     _user!.mobileNo = prefs.getString(AuthConstants.mobileNo) ?? "";
//     _user!.gender = prefs.getString(AuthConstants.gender) ?? "";
//     _user!.token = prefs.getString(AuthConstants.token) ?? "";
//
//     await setUser(
//       studentId: _user!.studentId,
//       firstName: _user!.firstName,
//       lastName: _user!.lastName,
//       mobileNo: _user!.mobileNo,
//       gender: _user!.gender,
//       token: _user!.token,
//     );
//     print(
//         'setUserFromPreference Mobile Number --- ${prefs.getString(AuthConstants.mobileNo)}');
//   }
//
//   Future<void> updateTokenInSharedPrefs(String token) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(AuthConstants.token, token);
//   }
//
//   Future<void> updateUserInSharedPrefs(String? studentId, String? firstName,
//       String? lastName, String? mobileNo, String? gender, String? token) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(AuthConstants.studentID, studentId!);
//     prefs.setString(AuthConstants.firstName, firstName!);
//     prefs.setString(AuthConstants.lastName, lastName!);
//     prefs.setString(AuthConstants.mobileNo, mobileNo!);
//     prefs.setString(AuthConstants.gender, gender!);
//     prefs.setString(AuthConstants.token, token!);
//
//     print(
//         'updateUserInSharedPrefs FirstNAme --- ${prefs.getString(AuthConstants.mobileNo)}');
//   }
//
//   Future<void> removeUserFromSharedPrefs() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.clear();
//   }
// }
