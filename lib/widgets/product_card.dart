import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/theme.dart';

import '../pages/product_page.dart';


class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPage(product),
        ),
      ),
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Image.network(product.galleries![0].url, width: 215, height: 150, fit: BoxFit.cover,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category!.name, style: secondaryTextStyle.copyWith(fontWeight: regular, fontSize: 12),),
                  SizedBox(height: 6,),
                  Text(product.name!, style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 6,),
                  Text("\$${product.price}", style: priceTextStyle.copyWith(fontWeight: medium, fontSize: 14),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
