import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_card.dart';
import 'package:shamo/widgets/product_tile.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                  Text("Hallo, Alex", style: primaryTextStyle.copyWith(fontWeight: semiBold,fontSize: 24),),
                  Text("@alexin", style: subtitleTextStyle.copyWith(fontWeight: regular,fontSize: 16),),
                ],
              ),
            ),

            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/image_profile.png"))
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
              Row(children: [
                ProductCard(),
                ProductCard(),
                ProductCard(),
              ],)
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
          children: [
            ProductTile(), ProductTile(), ProductTile(), ProductTile(),
          ],
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
