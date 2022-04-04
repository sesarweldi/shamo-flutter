import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

import '../models/product_model.dart';
import '../pages/product_page.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);


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
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, top: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  product.galleries![0].url,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )),
            SizedBox(width: 12,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category!.name,
                  style: secondaryTextStyle.copyWith(
                      fontWeight: regular, fontSize: 12),
                ),
                SizedBox(height: 6,),
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                SizedBox(height: 6,),

                Text(
                  "\$${product.price}",
                  style: priceTextStyle.copyWith(
                      fontWeight: medium, fontSize: 14),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
