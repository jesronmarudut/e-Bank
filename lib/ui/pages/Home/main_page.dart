import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/Home/nav_reward_page.dart';
import 'package:bank/ui/pages/Home/nav_statistic_page.dart';
import 'package:bank/ui/pages/Home/nav_transfer_page.dart';
import 'package:bank/ui/pages/home/nav_history_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav_home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //   Widget cartButton() {
    //     return FloatingActionButton(
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/cart');
    //       },
    //       backgroundColor: warna2,
    //       child: Image.asset(
    //         'assets/icon_cart.png',
    //         width: 30,
    //       ),
    //     );
    //   }

    Widget customBottomNav() {
      return BottomNavigationBar(
        backgroundColor: background2,
        currentIndex: currentIndex,
        onTap: (value) {
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: greyColor2,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 7.5),
                child: Icon(
                  Icons.home_rounded,
                  color: currentIndex == 0 ? purpleColor : greyColor2,
                ),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 7.5),
                child: Icon(
                  Icons.watch_later_rounded,
                  color: currentIndex == 1 ? purpleColor : greyColor2,
                ),
              ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 7.5),
                child: Icon(
                  Icons.paid,
                  color: currentIndex == 2 ? purpleColor : greyColor2,
                ),
              ),
              label: 'Pay'),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 7.5),
                child: Icon(
                  Icons.equalizer,
                  color: currentIndex == 3 ? purpleColor : greyColor2,
                ),
              ),
              label: 'Analytics'),
          BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 7.5),
                child: Icon(
                  Icons.emoji_events,
                  color: currentIndex == 4 ? purpleColor : greyColor2,
                ),
              ),
              label: 'Reward'),
          // icon: Container(
          //   margin: EdgeInsets.only(top: 10, bottom: 7.5),
          //   child: Image.asset(
          //     'assets/icon_profile.png',
          //     width: 23,
          //     color: currentIndex == 4 ? warna2 : Color(0xff504F5E),
          //   ),
          // ),
          // label: 'Profile'),
        ],
        // selectedLabelStyle: bacground2TextStyle,

        selectedItemColor: purpleColor, //Ganti warna Label
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return HistoryPage();
          break;
        case 2:
          return NavTransferPage();
          break;
        case 3:
          return StatisticPage();
          break;
        case 4:
          return RewardPage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      // extendBody: true, //membuat notch transparan
      // backgroundColor: currentIndex == 0 ? warna1 : priceColor,
      backgroundColor: redColor,
      resizeToAvoidBottomInset: false,
      // floatingActionButton: cartButton(),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerDocked, //Button di tengah
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
