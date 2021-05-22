import 'package:danoetz_vascomm/core/models/Product.dart';
import 'package:danoetz_vascomm/core/models/TipeLayanan.dart';
import 'package:danoetz_vascomm/ui/login/login_screen.dart';
import 'package:danoetz_vascomm/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:danoetz_vascomm/core/models/Menu.dart';
import 'package:danoetz_vascomm/core/repository/data.dart';
import 'package:danoetz_vascomm/shared/helpers/helpers.dart';
import 'package:danoetz_vascomm/shared/styles/colors.dart';
import 'package:danoetz_vascomm/shared/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final globalKey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();
  TabController _tabController;

  List<Menu> listMenu = [];
  List<Product> listProducts = [];
  List<TipeLayanan> listTipeLayanan = [];
  int _selectedMenu = 0;

  @override
  void initState() {
    super.initState();
    listMenu = Data().listMenu;
    listProducts = Data().listProducts;
    listTipeLayanan = Data().listTipeLayanan;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

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
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 85, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/img_profile_pic.png'),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Angga, ',
                                  style: TextStyle(
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Praja',
                                  style: TextStyle(color: MyColors.primary, fontWeight: FontWeight.w400, fontSize: 14),
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
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Profile Saya',
                            fontSize: 11,
                            color: MyColors.primary.withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: MyColors.darkGray,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Pengaturan',
                        fontSize: 11,
                        color: MyColors.primary.withOpacity(0.5),
                        fontWeight: FontWeight.w600,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: MyColors.darkGray,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  RoundedFlatButton(
                    borderRadius: BorderRadius.circular(23),
                    width: double.infinity,
                    height: 28,
                    color: MyColors.red,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 50),
                    child: CustomText(
                      text: 'Logout',
                      color: MyColors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false);
                    },
                  ),
                  SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Ikuti kami di',
                        fontSize: 16,
                        color: MyColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 12),
                      SvgPicture.asset('assets/icons/ic_facebook.svg'),
                      SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/ic_instagram.svg'),
                      SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/ic_twitter.svg'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'FAQ',
                    fontSize: 14,
                    color: MyColors.textLightGray,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    text: 'Terms and Conditions',
                    fontSize: 14,
                    color: MyColors.textLightGray,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: ListView(
          physics: BouncingScrollPhysics(),
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
            SizedBox(height: 22),
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
            // SEARCH
            SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: CircleBorder(), primary: Colors.white),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Icon(
                        Icons.menu,
                        color: MyColors.primary,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: MyColors.textLightGray,
                            offset: Offset(0, 16),
                            blurRadius: 24,
                          ),
                        ],
                      ),
                      child: TextField(
                        autocorrect: false,
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          suffixIcon: Icon(
                            Icons.search,
                            color: MyColors.primary,
                          ),
                          hintStyle: TextStyle(color: MyColors.textHint),
                          filled: true,
                          fillColor: Colors.white70,
                          contentPadding: EdgeInsets.symmetric(horizontal: 24),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // MENU
            SizedBox(height: 40),
            Container(
              height: 30,
              width: SizeConfig.screenWidth,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 20.0)
                        : (index == listMenu.length - 1 ? const EdgeInsets.only(right: 20.0) : EdgeInsets.zero),
                    child: RoundedFlatButton(
                      borderRadius: BorderRadius.circular(30),
                      width: 86,
                      height: 30,
                      color: listMenu[_selectedMenu] == listMenu[index] ? MyColors.primary : MyColors.white,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: CustomText(
                          text: listMenu[index].value,
                          color: listMenu[_selectedMenu] == listMenu[index] ? MyColors.white : MyColors.primary,
                          fontSize: 12,
                          fontWeight: listMenu[_selectedMenu] == listMenu[index] ? FontWeight.w700 : FontWeight.w600,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedMenu = index;
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: listMenu.length,
              ),
            ),
            // PRODUCT
            SizedBox(height: 26),
            Container(
              height: 180,
              width: SizeConfig.screenWidth,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Product item = listProducts[index];
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 20.0)
                        : (index == listProducts.length - 1 ? const EdgeInsets.only(right: 20.0) : EdgeInsets.zero),
                    child: Card(
                      elevation: 7,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        height: 176,
                        width: 160,
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.star, color: MyColors.yellow, size: 20),
                                SizedBox(width: 4),
                                CustomText(
                                  text: item.rating.toString(),
                                  color: MyColors.textLightGray,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Image.asset(
                              item.photo,
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: item.name,
                                color: MyColors.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: item.price,
                                  color: MyColors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: MyColors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: CustomText(
                                    text: item.name,
                                    color: MyColors.greenText,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: listProducts.length,
              ),
            ),
            SizedBox(height: 20),
            CustomText(
              text: "Pilih Tipe Layanan Kesehatan Anda",
              color: MyColors.primary,
              fontWeight: FontWeight.w600,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            SizedBox(height: 20),
            Container(
              height: 34,
              width: 228,
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: [
                    Tab(text: 'Satuan'),
                    Tab(text: 'Paket Pemeriksaan'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                itemCount: listTipeLayanan.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 30),
                itemBuilder: (context, index) {
                  TipeLayanan item = listTipeLayanan[index];
                  return Card(
                    elevation: 7,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      height: 150,
                      width: SizeConfig.screenWidth,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: item.name,
                                        color: MyColors.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text: item.result,
                                        color: MyColors.primary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                  CustomText(
                                    text: item.price,
                                    color: MyColors.orange,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset('assets/icons/ic_hospital.svg'),
                                          SizedBox(width: 4),
                                          CustomText(
                                            text: item.building,
                                            color: MyColors.textGray,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset('assets/icons/ic_location.svg'),
                                          SizedBox(width: 4),
                                          CustomText(
                                            text: item.address,
                                            color: MyColors.textGray,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: 119,
                              height: 149,
                              child: Image.asset(
                                item.photo,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
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
