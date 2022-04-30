// import 'package:country_code_picker/country_code_picker.dart';
import '/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';

class LoginTextField extends StatelessWidget {
  TextEditingController? controller;
  // Function(CountryCode)? changedCountry;

  LoginTextField({Key? key, this.controller,
    // this.changedCountry
  }) : super(key: key);

  TextStyle style = AppTextStyle.getStyle()
      .openSansRegular!
      .copyWith(color: Colors.black, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 55,
          // padding: const EdgeInsets.all(7),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
          ),
          child: Center(child: Text("+91")),
          // child: CountryCodePicker(
          //   // onChanged: changedCountry,
          //   favorite: const ['+91'],
          //   flagWidth: 0,
          //   initialSelection: '+91',
          //   showCountryOnly: false,
          //   showFlagMain:false,
          //   showOnlyCountryWhenClosed: false,
          //   alignLeft: false,
          // ),
        ),
        Container(
          width: MediaQuery.of(context).size.width - 130,
          height: 55,
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: TextFormField(
            cursorColor: Colors.black,
            controller: controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20),
              border: InputBorder.none,
              hintText: Constants.mobileNumber,
              hintStyle: style,
            ),
          ),
        ),
      ],
    );
  }
}
