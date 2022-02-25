import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  List familiarShoes = [
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
    'assets/image_shoes.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {


    Future<void> showSuccessDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
            width: MediaQuery.of(context).size.width - (2 * defaultMargin),
            child: AlertDialog(
              backgroundColor: backgroundColor3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(onTap: (){Navigator.pop(context);},child: Align(alignment: Alignment.centerLeft,child: Icon(Icons.close, color: primaryTextColor,))),
                    Image.asset("assets/ic_success.png", width: 100,),
                    SizedBox(height: 12,),
                    Text("Hurray :)", style: primaryTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),),
                    SizedBox(height: 12,),
                    Text("Item added successfully", style: secondaryTextStyle,),
                    SizedBox(height: 20,),
                    Container(
                      height: 45,
                      width: 155,
                      child: TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, "/cart"),
                        child: Text("View My Cart",style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 16),),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          ),
                          backgroundColor: primaryColor
                        ),
                      ),
                    )
                    

                  ],
                ),
              ),
            ),
          ));
    }

    Widget indicator(int index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex != index ? indicatorColor : primaryColor),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
            borderRadius: BorderRadius.circular(8)),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, right: defaultMargin, left: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.chevron_left)),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.shopping_bag,
                    color: backgroundColor1,
                  ),
                )
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((image) =>
                  Image.asset(
                    image,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 310,
                    fit: BoxFit.cover,
                  ))
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        margin: EdgeInsets.only(top: 14),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: backgroundColor1),
        child: Column(
          children: [
            //header
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TERREX URBAN LOW",
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 18),
                        ),
                        Text(
                          "Hiking",
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        setState(() {
                          isWishlist = !isWishlist;
                          if (isWishlist) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Has been added to the Wishlist",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 12, fontWeight: regular),
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: secondaryColor,));
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Has been removed from the Wishlist",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 12, fontWeight: regular),
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: alertColor,));
                          }
                        }),
                    child: Image.asset(
                      isWishlist
                          ? "assets/button_wishlist_blue.png"
                          : "assets/button_wishlist.png",
                      width: 46,
                    ),
                  )
                ],
              ),
            ),

            //price
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: backgroundColor2,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price starts from",
                    style: primaryTextStyle,
                  ),
                  Text(
                    "\$300",
                    style: priceTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  )
                ],
              ),
            ),

            //desc
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  right: defaultMargin,
                  left: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            //familiar shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "Familiar Shoes",
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarShoesCard(image));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            //buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: ()=> Navigator.pushNamed(context, "/detail-chat"),
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/button_chat.png"))),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          showSuccessDialog();
                        },
                        child: Text(
                          "Add to Cart",
                          style: primaryTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.065,
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor7,
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
