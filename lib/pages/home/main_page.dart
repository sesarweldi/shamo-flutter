import 'package:flutter/material.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';

import '../../theme.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget floatCartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        child: Image.asset(
          "assets/ic_cart.png",
          width: 20,
        ),
        backgroundColor: secondaryColor,
      );
    }

    Widget customButtomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor4,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20,bottom: 10),
                      child: Image.asset(
                        "assets/ic_home.png",
                        width: 21,
                        color:
                            currentIndex == 0 ? primaryColor : backgroundColor5,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20,bottom: 10),
                      child: Image.asset(
                        "assets/ic_chat.png",
                        width: 21,
                        color:
                            currentIndex == 1 ? primaryColor : backgroundColor5,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20,bottom: 10),
                      child: Image.asset(
                        "assets/ic_fav.png",
                        width: 21,
                        color:
                            currentIndex == 2 ? primaryColor : backgroundColor5,
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20,bottom: 10),
                      child: Image.asset(
                        "assets/ic_profile.png",
                        width: 21,
                        color:
                            currentIndex == 3 ? primaryColor : backgroundColor5,
                      ),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    Widget body(){
       switch(currentIndex){
        case 0:
          return HomePage();
          break;
        case 1:
          return ChatPage();
          break;
        case 2:
          return WishlistPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }


    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1: backgroundColor3,
      floatingActionButton: floatCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtomNav(),
      body: body(),
    );
  }
}
