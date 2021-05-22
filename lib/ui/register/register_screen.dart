import 'dart:ui';

import 'package:danoetz_vascomm/shared/helpers/helpers.dart';
import 'package:danoetz_vascomm/ui/home/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:danoetz_vascomm/shared/styles/styles.dart';
import 'package:danoetz_vascomm/shared/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _namaDepanController = TextEditingController();
  final _namaBelakangController = TextEditingController();
  final _noKtpController = TextEditingController();
  final _emailController = TextEditingController();
  final _noTelponController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmasiPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureKonfirmasiPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _namaDepanController.dispose();
    _namaBelakangController.dispose();
    _noKtpController.dispose();
    _emailController.dispose();
    _noTelponController.dispose();
    _passwordController.dispose();
    _konfirmasiPasswordController.dispose();
    super.dispose();
  }

  void _togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleKonfirmasiPassword() {
    setState(() {
      _obscureKonfirmasiPassword = !_obscureKonfirmasiPassword;
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
          color: MyColors.white,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomInputTextField(
                      controller: _namaDepanController,
                      name: 'namaDepan',
                      label: 'Nama Depan',
                      hintText: 'Jhon',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Expanded(
                    child: CustomInputTextField(
                      controller: _namaBelakangController,
                      name: 'namaBelakang',
                      label: 'Nama Belakang',
                      hintText: 'Doe',
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              CustomInputTextField(
                controller: _noKtpController,
                name: 'noKtp',
                label: 'No. KTP',
                hintText: 'Masukkan No. KTP anda',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 40),
              CustomInputTextField(
                controller: _emailController,
                name: 'email',
                label: 'Email',
                hintText: 'Masukkan email anda',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 40),
              CustomInputTextField(
                controller: _noTelponController,
                name: 'noTelpon',
                label: 'No. Telpon',
                hintText: 'Masukkan No. Telp anda',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 40),
              CustomInputTextField(
                controller: _passwordController,
                name: 'password',
                label: 'Password',
                hintText: 'Masukkan password anda',
                textInputAction: TextInputAction.next,
                obscureText: _obscurePassword,
                onTap: _togglePassword,
                iconWidget: SvgPicture.asset(
                  'assets/icons/ic_eye.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(height: 40),
              CustomInputTextField(
                controller: _konfirmasiPasswordController,
                name: 'konfirmasiPassword',
                label: 'Konfirmasi Password',
                hintText: 'Konfirmasi password anda',
                textInputAction: TextInputAction.next,
                obscureText: _obscureKonfirmasiPassword,
                onTap: _toggleKonfirmasiPassword,
                iconWidget: SvgPicture.asset(
                  'assets/icons/ic_eye.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                  color: MyColors.primary,
                  elevation: 16,
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
                              text: "Register",
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
                        text: 'Sudah punya akun? ',
                        style: TextStyle(
                          color: MyColors.textLightGray,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: 'Login sekarang\n',
                        style: TextStyle(
                          color: MyColors.title,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
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
