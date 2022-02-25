import 'package:flutter/material.dart';

import '../theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
        ),
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ic_empty_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You made a transaction',
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            Text('Stay at home while we prepare your dream shoes',style: secondaryTextStyle,textAlign: TextAlign.center,),
            Container(
              width: 200,
              height: 45,
              margin: EdgeInsets.only(top: defaultMargin),
              child: TextButton(
                onPressed: ()=> Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),
                child: Text('Order Other Shoes', style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
              ),
            ),
            Container(
              width: 200,
              height: 45,
              margin: EdgeInsets.only(top: 12),
              child: TextButton(
                onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false),
                child: Text('View My Order', style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xff39374B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
