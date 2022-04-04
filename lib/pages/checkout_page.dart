import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_card.dart';
import 'package:shamo/widgets/loading_button.dart';

import '../providers/auth_provider.dart';
import '../providers/cart_provider.dart';
import '../providers/transaction_provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (await transactionProvider.checkout(
        authProvider.user.token!,
        cartProvider.carts,
        cartProvider.totalPrice(),
      )) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }

      setState(() {
        isLoading = false;
      });
    }

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 18),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [

          //list items
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "List Items",
                  style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                  )
                      .toList(),
                ),
              ],
            ),
          ),

          //address details
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text('Address Details', style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
              SizedBox(height: 12,),
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/ic_store_location.png', width: 40,),
                      Image.asset('assets/ic_line.png', height: 30,),
                      Image.asset('assets/ic_address.png', width: 40,),
                    ],
                  ),
                  SizedBox(width: 12,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('Store Location', style: secondaryTextStyle.copyWith(fontSize: 12, fontWeight: light),),
                    Text('Adidas Core', style: primaryTextStyle.copyWith(fontWeight: medium),),
                    SizedBox(height: defaultMargin,),
                    Text('Your Address', style: secondaryTextStyle.copyWith(fontSize: 12, fontWeight: light),),
                    Text('Jakarta', style: primaryTextStyle.copyWith(fontWeight: medium),),

                  ],)
                ],
              )
            ],),
          ),

          //payment summary
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text('Payment Summary',style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),),
              SizedBox(height: 12,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text('Product Quantity', style: secondaryTextStyle.copyWith(fontWeight: regular, fontSize: 12),),
                Text('${cartProvider.totalItems()} Items',style: primaryTextStyle.copyWith(fontWeight: medium),)
              ],

              ),
              SizedBox(height: 12,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text('Product Price', style: secondaryTextStyle.copyWith(fontWeight: regular, fontSize: 12),),
                Text('\$${cartProvider.totalPrice()}',style: primaryTextStyle.copyWith(fontWeight: medium),)
              ],

              ),
              SizedBox(height: 12,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text('Shipping', style: secondaryTextStyle.copyWith(fontWeight: regular, fontSize: 12),),
                Text('Free',style: primaryTextStyle.copyWith(fontWeight: medium),)
              ],

              ),
              SizedBox(height: 12,),
              Divider(thickness: 1,color: Color(0xff2E3141),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: priceTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),),
                  Text('\$${cartProvider.totalPrice()}', style: priceTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),)
                ],
              )

            ],),
          ),

          SizedBox(height: defaultMargin,),
          Divider(thickness: 1,color: Color(0xff2E3141),),

          //checkout button
         isLoading?Container(
           margin: EdgeInsets.only(
             bottom: 30,
           ),
           child: LoadingButton(),
         ): Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            child: TextButton(
              onPressed: handleCheckout,
              child: Text('Checkout Now', style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: primaryColor
              ),
            ),

          )


        ],
      );
    }



    return Scaffold(
        appBar: header(), backgroundColor: backgroundColor3, body: content());
  }
}
