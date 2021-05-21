import 'dart:ui';

import 'package:danoetz_vascomm/shared/helpers/helpers.dart';
import 'package:danoetz_vascomm/ui/home/home_screen.dart';
import 'package:danoetz_vascomm/ui/register/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:danoetz_vascomm/shared/styles/styles.dart';
import 'package:danoetz_vascomm/shared/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: SizeConfig.screenWidth,
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hai, ',
                        style: TextStyle(
                          color: MyColors.title,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                      TextSpan(
                        text: 'Selamat Datang\n',
                        style: TextStyle(color: MyColors.title, fontWeight: FontWeight.w800, fontSize: 28),
                      ),
                      TextSpan(
                        text: 'Silahkan login untuk melanjutkan',
                        style: TextStyle(color: MyColors.subTitle, fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRect(
                    clipBehavior: Clip.hardEdge,
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Image.asset(
                          'assets/images/img_overview.png',
                          width: SizeConfig.screenWidth * 0.9,
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                ],
              ),
              CustomInputTextField(
                controller: _emailController,
                name: 'email',
                label: 'Email',
                hintText: 'Masukkan email anda',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Password',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: MyColors.primary,
                      padding: EdgeInsets.only(bottom: 16.0),
                    ),
                    CustomText(
                      text: 'Lupa password Anda?',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.subTitle,
                      padding: EdgeInsets.only(bottom: 16.0),
                    ),
                  ],
                ),
              ),
              CustomInputTextField(
                controller: _passwordController,
                name: 'password',
                hintText: 'Masukkan password anda',
                obscureText: _obscureText,
                textInputAction: TextInputAction.done,
                iconWidget: SvgPicture.asset(
                  'assets/icons/ic_eye.svg',
                  fit: BoxFit.scaleDown,
                ),
                onTap: _toggle,
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  color: MyColors.primary,
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SizedBox(
                    height: 48,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 63,
                          child: Center(
                            child: CustomText(
                              text: "Login",
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          bottom: 10,
                          right: 12,
                          child: Icon(
                            Icons.arrow_forward,
                            color: MyColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Belum punya akun? ',
                        style: TextStyle(
                          color: MyColors.textLightGray,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Daftar sekarang\n',
                        style: TextStyle(
                          color: MyColors.title,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.copyright_sharp, size: 12),
                  CustomText(
                    text: 'SILK. all right reserved.',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: MyColors.textLightGray,
                    padding: EdgeInsets.only(left: 8),
                  ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
