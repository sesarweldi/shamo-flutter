import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/wishlist_card.dart';

import '../../providers/page_provider.dart';
import '../../providers/wishlist_provider.dart';


class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);


    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text("Favorite Shoes", style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist(){
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/ic_empty_fav.png",width: 74,),
              SizedBox(height: 24,),
              Text("You don't have dream shoes?", style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
              SizedBox(height: 12,),
              Text("Let's find your favorite shoes", style: secondaryTextStyle,),
              SizedBox(height: 20,),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: (){
                    pageProvider.currentIndex = 0;
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  child: Text("Explore Store",style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content(){
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          color: backgroundColor3,
          child: ListView(
            children: wishlistProvider.wishlist
                .map(
                  (product) => WishlistCard(product),
            )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content()
        /*emptyWishlist()*/
      ],
    );
  }
}
