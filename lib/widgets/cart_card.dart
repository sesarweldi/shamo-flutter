import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.asset("assets/image_shoes.png", width: 60,)),
              SizedBox(width: 12,),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text("Terrex Urban Low", style: primaryTextStyle.copyWith(fontWeight: semiBold),),
                  Text("\$200", style: priceTextStyle,)
                ],),
              ),
              Column(
                children: [
                  Image.asset("assets/button_add.png", width: 16,),
                  SizedBox(height: 2,),
                  Text("0", style: primaryTextStyle.copyWith(fontWeight: medium),),
                  SizedBox(height: 2,),
                  Image.asset("assets/button_min.png", width: 16,),
                ],
              )],),
          SizedBox(height: 12),
          Row(
            children: [
              Image.asset("assets/ic_remove.png", width: 10,),
              SizedBox(width: 4,),
              Text("Remove", style: alertTextStyle.copyWith(fontWeight: light, fontSize: 12),)
            ],
          )
        ],
      ),
    );
  }
}
