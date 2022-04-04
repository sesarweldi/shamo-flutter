import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';

import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    user.profilePhotoUrl,
                    width: 64,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo, ${user.name}",
                        style: primaryTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 24),
                      ),
                      Text(
                        "@${user.username}",
                        style: subtitleTextStyle.copyWith(
                            fontWeight: regular, fontSize: 16),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/sign-in', (route) => false);
                    },
                    child: Image.asset(
                      "assets/button_exit.png",
                      width: 20,
                    )),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItemProfile(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style:
              subtitleTextStyle.copyWith(fontWeight: regular, fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: secondaryTextColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(color: backgroundColor3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Account",
                style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, "/edit-profile");
              }, child: menuItemProfile("Edit Profile")),
              menuItemProfile("Your Order"),
              menuItemProfile("Help"),
              SizedBox(
                height: 30,
              ),
              Text(
                "General",
                style:
                primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              menuItemProfile("Privacy & Policy"),
              menuItemProfile("Term of Service"),
              menuItemProfile("Rate App"),
            ],
          ),
        ),
      );
    }


    return Column(
      children: [header(), content()],
    );
  }
}
