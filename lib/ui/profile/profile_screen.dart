import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:danoetz_vascomm/shared/helpers/helpers.dart';
import 'package:danoetz_vascomm/shared/styles/colors.dart';
import 'package:danoetz_vascomm/shared/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  final globalKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormBuilderState>();
  TabController _tabController;

  final _namaDepanController = TextEditingController();
  final _namaBelakangController = TextEditingController();
  final _emailController = TextEditingController();
  final _noTelponController = TextEditingController();
  final _noKtpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _namaDepanController.dispose();
    _namaBelakangController.dispose();
    _emailController.dispose();
    _noTelponController.dispose();
    _noKtpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: MyColors.primary,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SvgPicture.asset('assets/icons/ic_cart.svg'),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 30),
            child: Row(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('assets/icons/ic_notification.svg'),
                    Positioned(
                      right: 4,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: MyColors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 40),
              Container(
                height: 41,
                width: 261,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: MyColors.secondary,
                    ),
                    labelColor: MyColors.primary,
                    unselectedLabelColor: MyColors.primary,
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    tabs: [
                      Tab(text: 'Profile Saya'),
                      Tab(text: 'Buy Now'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Card(
                margin: EdgeInsets.all(20),
                elevation: 7,
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Card(
                      elevation: 7,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.zero,
                      child: Stack(
                        children: [
                          Container(
                            height: 162,
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(
                                color: MyColors.primary,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: const Offset(0.0, 1.5),
                                    blurRadius: 1.0,
                                    spreadRadius: -1.0,
                                  )
                                ]),
                          ),
                          Positioned(
                              right: -30, bottom: 10, child: SvgPicture.asset('assets/images/img_circle_subr.svg')),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(
                                  0xff1a3e78,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: CustomText(
                                text: 'Lengkapi profile anda untuk memaksimalkan\npenggunaan aplikasi',
                                color: MyColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                              ),
                            ),
                          ),
                          Positioned(right: 23, bottom: 45, child: SvgPicture.asset('assets/images/img_ornamen.svg')),
                          Positioned(
                            top: -277,
                            left: -230,
                            child: Container(
                              height: 350,
                              width: 350,
                              decoration: BoxDecoration(
                                color: Color(0xffd9c6b3).withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 37,
                            left: 25,
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child:
                                        CircleAvatar(backgroundImage: AssetImage('assets/images/img_profile_pic.png')),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.left,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Angga, ',
                                              style: TextStyle(
                                                color: MyColors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Praja',
                                              style: TextStyle(
                                                  color: MyColors.white, fontWeight: FontWeight.w400, fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomText(
                                        text: 'Membership BBLK',
                                        fontSize: 12,
                                        color: MyColors.textMediumGray,
                                        fontWeight: FontWeight.w600,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                          text: 'Pilih data yang ingin ditampilkan',
                          color: MyColors.primary,
                          fontWeight: FontWeight.w600,
                          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
                          child: Row(
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: MyColors.secondary,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.location_history_rounded,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Data Diri',
                                    color: MyColors.textBlack,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  CustomText(
                                    text: 'Data diri anda sesuai KTP',
                                    color: MyColors.textLight,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: MyColors.bgGray,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.location_pin,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomInputTextField(
                          controller: _namaDepanController,
                          name: 'namaDepan',
                          label: 'Nama Depan',
                          hintText: 'Jhon',
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 40),
                        CustomInputTextField(
                          controller: _namaBelakangController,
                          name: 'namaBelakang',
                          label: 'Nama Belakang',
                          hintText: 'Doe',
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
                          controller: _noKtpController,
                          name: 'noKtp',
                          label: 'No. KTP',
                          hintText: 'Masukkan No. KTP anda',
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info,
                                color: MyColors.primary,
                                size: 16,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: CustomText(
                                  text:
                                      'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.textGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 34),
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
                                        text: "Simpan Profile",
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
                                      Icons.save_outlined,
                                      color: MyColors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 77),
              Container(
                width: SizeConfig.screenWidth,
                height: 107,
                color: MyColors.primary,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Ingin mendapat update",
                                color: MyColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              CustomText(
                                text: "dari kami?",
                                color: MyColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Dapatkan",
                                        color: MyColors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text: "notifikasi",
                                        color: MyColors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: MyColors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/images/img_circle_sub.svg'),
                    Positioned(right: 85, top: 18, child: SvgPicture.asset('assets/images/img_ornamen.svg')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildMenu() {
    List<String> list = [
      'All Product',
      'Layanan kesehatan',
      'Alat Kesehatan',
    ];
    List<Widget> listWidgets = list.map((item) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RoundedFlatButton(
            borderRadius: BorderRadius.circular(12),
            width: 86,
            height: 36,
            color: item == 'All Product' ? MyColors.primary : MyColors.white,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: CustomText(
              text: item,
              color: MyColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }).toList();
    return listWidgets;
  }
}
