import 'package:facebook_replication/widgets/custom_dialogs.dart';
import 'package:facebook_replication/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../widgets/custom_inkwell_button.dart';
import 'profile_screen.dart';
import 'home_screen.dart';
import '../widgets/custom_dialogs.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
    TextEditingController usernameController = TextEditingController(text: 'user');
    TextEditingController passwordController = TextEditingController(text: 'user');
    final _formKey = GlobalKey<FormState>();
  void login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (usernameController.text == "admin" &&
          passwordController.text == "1234") {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        CustomDialog.showErrorDialog(context, 'Invalid username or password');
      }
    }
  }
    bool isObscure = false;

    @override 
    void initState(){ 
      super.initState(); 
      isObscure=true; 
    }     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                                width: ScreenUtil().screenWidth,
                                height: ScreenUtil().setHeight(40),
                                color: FB_DARK_PRIMARY,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(25),                                   
                                ),
                                child: Column(
                                    children: [
                                        Image.asset(
                                            'assets/images/NUCCIT Logo_Black.png',
                                            height: ScreenUtil().setHeight(200),
                                        ),
                                        SizedBox(
                                            height: ScreenUtil().setHeight(30),
                                        ),
                                        CustomTextFormField(
                                            height: ScreenUtil().setHeight(10),
                                            width: ScreenUtil().setWidth(10),
                                            controller: usernameController,
                                            validator: (value) =>
                                                value!.isEmpty ? 'Enter your username' : null,
                                            onSaved: (value) => usernameController.text = value!,
                                            fontSize: ScreenUtil().setSp(15),
                                            fontColor: FB_DARK_PRIMARY,
                                            hintTextSize: ScreenUtil().setSp(15),
                                            hintText: 'Username'),
                                        SizedBox(
                                            height: ScreenUtil().setHeight(10),
                                        ),
                                        CustomTextFormField(
                                            height: ScreenUtil().setHeight(10),
                                            width: ScreenUtil().setWidth(10),
                                            controller: passwordController,
                                            isObscure: isObscure,
                                            validator: (value) =>
                                                value!.isEmpty ? 'Enter your password' : null,
                                            onSaved: (value) => passwordController.text = value!,
                                            fontSize: ScreenUtil().setSp(15),
                                            fontColor: FB_DARK_PRIMARY,
                                            hintTextSize: ScreenUtil().setSp(15),
                                            hintText: 'Password',
                                            suffixIcon: Align(
                                              widthFactor: 1.0,
                                              heightFactor: 1.0,
                                              child: IconButton(
                                                icon: Icon(
                                                  isObscure
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: FB_DARK_PRIMARY,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isObscure = !isObscure;
                                                  });
                                                },
                                              ),
                                            )),
                                        SizedBox(
                                            height: ScreenUtil().setHeight(50)
                                        ),
                                        CustomInkwellButton(
                                            onTap: () {
                                                if (_formKey.currentState!.validate()) {
                                                    _formKey.currentState!.save();
                                                    String username = usernameController.text;
                                                    
                                                

                                                Navigator.of(context).push(
                                                  MaterialPageRoute(

                                                    builder: (context) =>  HomeScreen(username: username),


                                                ),
                                                );
                                                }
                                            },
                                            height: ScreenUtil().setHeight(40),
                                            width: ScreenUtil().screenWidth,
                                            buttonName: 'Log In',
                                            fontSize: ScreenUtil().setSp(15),

                                            
                                        ),
                                    ],
                                ),
                            ),
                            Container(
                                width: ScreenUtil().screenWidth,
                                height: ScreenUtil().setHeight(40),
                                color: FB_DARK_PRIMARY,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(
                                            'You do not have an account?',
                                            style: TextStyle(
                                                color: Colors.grey.shade200,
                                                fontSize: ScreenUtil().setSp(15)                                           
                                            )
                                        ),
                                        GestureDetector(
                                            onTap: () => Navigator.popAndPushNamed(
                                                context, '/register'),
                                            child: Text(
                                                'Register here',
                                                style: TextStyle(
                                                    color: FB_LIGHT_PRIMARY,
                                                    fontSize: ScreenUtil().setSp(15),
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                        )
                                    ],
                                ),
                            )
                        ],
                    ),
                ),
            ),
        ),
    );
  }
}