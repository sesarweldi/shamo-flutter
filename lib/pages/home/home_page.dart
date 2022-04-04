import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_card.dart';
import 'package:shamo/widgets/product_tile.dart';

import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/product_provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header(){
      return Container(
        padding: EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hallo, ${user.name}", style: primaryTextStyle.copyWith(fontWeight: semiBold,fontSize: 24),),
                  Text("@${user.username}", style: subtitleTextStyle.copyWith(fontWeight: regular,fontSize: 16),),
                ],
              ),
            ),

            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image:
                NetworkImage(user.profilePhotoUrl))
              ),
            )
          ],
        ),
      );
    }

    Widget categories(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection:  Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor
                ),
                child: Text("All Shoes", style: primaryTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor
                ),
                child: Text("All Shoes", style: subtitleTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor
                ),
                child: Text("Training", style: subtitleTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor
                ),
                child: Text("Basket", style: subtitleTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: subtitleColor),
                    borderRadius: BorderRadius.circular(12),
                    color: transparentColor
                ),
                child: Text("Hiking", style: subtitleTextStyle.copyWith(fontSize: 13, fontWeight: medium),),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          "Popular Products",
          style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 22),
        ),
      );
    }

    Widget popularProducts(){
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin,),
              Row(children:
                productProvider.products
                    .map(
                      (product) => ProductCard(product),
                )
                    .toList(),)
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle(){
      return Container(
        margin: EdgeInsets.only(top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text(
          "New Arrivals",
          style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 22),
        ),
      );
    }

    Widget newArrivals(){
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductTile(product),
          )
              .toList(),
        ),
      );
    }



    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals()
      ],
    );
  }
}
