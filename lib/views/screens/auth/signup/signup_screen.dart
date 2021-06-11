import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/views/widgets/form_errors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailInputTextController = TextEditingController();
  TextEditingController passwordInputTextController = TextEditingController();
  TextEditingController usernameInputTextController = TextEditingController();
  TextEditingController phoneInputTextController = TextEditingController();

  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                right: getProportionateScreenWidth(20),
                left: getProportionateScreenWidth(20)),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    'bazar',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(50),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: getProportionateScreenWidth(25),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildUsernameField(),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      _buildEmailField(),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      _buildPasswordField(),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      _buildPhoneField(),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      FormViewErrors(errors: errors),
                      // SizedBox(height: getProportionateScreenHeight(20)),
                      _buildSubmitBtn(),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      _buildSpanText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildUsernameField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmptyUsername)) {
          errors.remove(kEmptyUsername);
        }

        if (value.length > 2 &&
            value.isNotEmpty &&
            errors.contains(kShortUsername)) {
          setState(() {
            errors.remove(kShortUsername);
          });
        }
      },
      validator: (val) {
        if (val!.isEmpty && !errors.contains(kEmptyUsername)) {
          setState(() {
            errors.add(kEmptyUsername);
          });
        }

        if (val.length <= 2 && val.isEmpty && errors.contains(kShortUsername)) {
          setState(() {
            errors.remove(kShortUsername);
          });
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      controller: usernameInputTextController,
      onSaved: (String? val) {
        val = usernameInputTextController.text.toString();
      },
      autofocus: true,
      // autovalidateMode: AutovalidateMode.always,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Username',
        suffixIcon: const Icon(Icons.person),
        suffixIconConstraints:
            BoxConstraints(minWidth: getProportionateScreenWidth(60.0)),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        hintText: 'Enter your username',
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmptyEmail)) {
          errors.remove(kEmptyEmail);
        }
        if (kEmailRegex.hasMatch(value) && errors.contains(kInvalidEmail)) {
          setState(() {
            errors.remove(kInvalidEmail);
          });
        }
      },
      validator: (val) {
        if (val!.isEmpty && !errors.contains(kEmptyEmail)) {
          setState(() {
            errors.add(kEmptyEmail);
          });
        }
        if (!kEmailRegex.hasMatch(val) && !errors.contains(kInvalidEmail)) {
          setState(() {
            errors.add(kInvalidEmail);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      controller: emailInputTextController,
      onSaved: (String? val) {
        val = emailInputTextController.text.toString();
      },
      autofocus: true,
      // autovalidateMode: AutovalidateMode.always,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Email',
        suffixIcon: const Icon(Icons.email),
        suffixIconConstraints:
            BoxConstraints(minWidth: getProportionateScreenWidth(60.0)),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        hintText: 'Enter your email',
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  TextFormField _buildPasswordField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmptyPassword)) {
          setState(() {
            errors.remove(kEmptyPassword);
          });
        }
        if (value.length >= 6 &&
            value.isNotEmpty &&
            errors.contains(kShortPassword)) {
          setState(() {
            errors.remove(kShortPassword);
          });
        }
      },
      validator: (val) {
        if (val!.isEmpty && !errors.contains(kEmptyPassword)) {
          setState(() {
            errors.add(kEmptyPassword);
          });
        }
        if (val.length < 6 && !errors.contains(kShortPassword)) {
          setState(() {
            errors.add(kShortPassword);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      controller: passwordInputTextController,
      onSaved: (String? val) {
        val = passwordInputTextController.text.toString();
      },
      autofocus: true,
      obscureText: true,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Password',
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: const Icon(Icons.lock),
        suffixIconConstraints:
            BoxConstraints(minWidth: getProportionateScreenWidth(60.0)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        hintText: 'Enter your password',
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  TextFormField _buildPhoneField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmptyPhone)) {
          errors.remove(kEmptyPhone);
        }

        if (kPhoneRegex.hasMatch(value) && errors.contains(kInvalidPhone)) {
          setState(() {
            errors.remove(kInvalidPhone);
          });
        }
      },
      validator: (val) {
        if (val!.isEmpty && !errors.contains(kEmptyPhone)) {
          setState(() {
            errors.add(kEmptyPhone);
          });
        }

        if (!kPhoneRegex.hasMatch(val) && !errors.contains(kInvalidPhone)) {
          setState(() {
            errors.remove(kInvalidPhone);
          });
        }

        return null;
      },
      keyboardType: TextInputType.phone,
      controller: phoneInputTextController,
      onSaved: (String? val) {
        val = phoneInputTextController.text.toString();
      },
      autofocus: true,
      // autovalidateMode: AutovalidateMode.always,
      toolbarOptions: const ToolbarOptions(
        copy: true,
        cut: true,
        paste: true,
        selectAll: true,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Phone',
        suffixIcon: const Icon(Icons.phone_android),
        suffixIconConstraints:
            BoxConstraints(minWidth: getProportionateScreenWidth(60.0)),
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0),
          borderRadius: BorderRadius.circular(50.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50.0),
        ),
        hintText: 'Enter your phone',
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 15.0),
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenHeight(60),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(10),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 15),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: const Text('SUBMIT'),
      ),
    );
  }

  Widget _buildSpanText() {
    return Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/signin');
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Have an account ? ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kSecondaryColor,
                  ),
                ),
                TextSpan(
                  text: 'Signin',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Row loading = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      CircularProgressIndicator(),
      Text(" Authenticating ... Please wait")
    ],
  );
}
