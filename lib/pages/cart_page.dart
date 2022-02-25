import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_card.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text("Your Cart", style: primaryTextStyle.copyWith(),),
        elevation: 0,
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/ic_empty_cart.png", width: 80,),
            SizedBox(height: 20,),
            Text("Opss! Your Cart is Empty", style: primaryTextStyle.copyWith(
                fontSize: 16, fontWeight: medium),),
            SizedBox(height: 12,),
            Text("Let's find your favorite shoes", style: secondaryTextStyle,),
            Container(
              height: 45,
              width: 155,
              margin: EdgeInsets.only(top: 20),
              child: TextButton(onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false),
                child: Text("Explore Store", style: primaryTextStyle.copyWith(
                    fontWeight: medium, fontSize: 16),),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),),

            )
          ],
        ),
      );
    }


    Widget content(){
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          CartCard()
        ],
      );
    }

    Widget customBottomNav(){
      return Container(
        height: 185,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal", style: primaryTextStyle,),
                  Text("\$500", style: priceTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),)
                ],
              ),
            ),
            SizedBox(height: 30,),
            Divider(thickness: 0.5, color: subtitleColor,),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 50,
              child: TextButton(
                onPressed: ()=>  Navigator.pushNamed(context, '/checkout'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Continue to Checkout", style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),),
                    Icon(Icons.arrow_forward, color: primaryTextColor,)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      body: content(),
      appBar: header(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
