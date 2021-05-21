import 'package:danoetz_vascomm/shared/helpers/helpers.dart';
import 'package:danoetz_vascomm/shared/styles/colors.dart';
import 'package:danoetz_vascomm/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => globalKey.currentState.openEndDrawer(),
          child: Icon(
            Icons.menu,
            color: MyColors.primary,
          ),
        ),
        backgroundColor: Colors.transparent,
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
      endDrawer: Drawer(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.list),
            title: Text("GFG item $index"),
            trailing: Icon(Icons.done),
          );
        }),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        color: MyColors.white,
        child: ListView(
          children: [
            // CALENDER
            SizedBox(height: 15),
            Container(
              height: 160,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Card(
                      elevation: 7,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 131,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.white, MyColors.gradientBlue],
                            stops: [0.6, 1.0],
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Solusi, ',
                                        style: TextStyle(
                                          color: MyColors.title,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Kesehatan Anda',
                                        style:
                                            TextStyle(color: MyColors.title, fontWeight: FontWeight.w800, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomText(
                                  text: 'Update informasi seputar kesehatan\nsemua bisa disini!',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.subTitle,
                                ),
                                RaisedButton(
                                  color: MyColors.primary,
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  clipBehavior: Clip.hardEdge,
                                  child: Container(
                                    height: 32,
                                    width: 110,
                                    child: Center(
                                      child: CustomText(
                                        text: "Selengkapnya",
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(right: 20, child: SvgPicture.asset('assets/images/img_calender.svg')),
                ],
              ),
            ),
            // VACCINE
            SizedBox(height: 27),
            Container(
              height: 160,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Card(
                      elevation: 7,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 131,
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Layanan Khusus',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.primary,
                                ),
                                CustomText(
                                  text: 'Tes Covid 19, Cegah Corona\nSedini Mungkin',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.subTitle,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text: 'Daftar Tes',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.primary,
                                        padding: EdgeInsets.only(right: 10),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: MyColors.primary,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(right: 45, child: SvgPicture.asset('assets/images/img_vaccine.svg')),
                ],
              ),
            ),
            // LOOP
            SizedBox(height: 27),
            Container(
              height: 160,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Card(
                      elevation: 7,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 131,
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 110.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: 'Track Pemeriksaan',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.primary,
                                  ),
                                  CustomText(
                                    text: 'Kamu dapat mengecek progress\npemeriksaanmu disini',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.subTitle,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: 'Track',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: MyColors.primary,
                                          padding: EdgeInsets.only(right: 10),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: MyColors.primary,
                                          size: 14,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(left: 45, top: 20, child: SvgPicture.asset('assets/images/img_loop.svg')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
