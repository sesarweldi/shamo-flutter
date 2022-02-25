import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';


 class DetailChatPage extends StatelessWidget {
   const DetailChatPage({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     
     PreferredSizeWidget header(){
       return PreferredSize(child: AppBar(
         backgroundColor: backgroundColor1,
         centerTitle: false,
         title: Row(
           children: [
             Image.asset("assets/image_profile_online.png", width: 50,),
             SizedBox(width: 12),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Shoe Store", style: primaryTextStyle.copyWith(fontWeight: medium, fontSize: 14),),
                 Text("Online", style: secondaryTextStyle.copyWith(fontWeight: light, fontSize: 14),),
               ],
             )
           ],
         ),
       ), preferredSize: Size.fromHeight(70));
     }

     Widget productPreview(){
       return Container(
         padding: EdgeInsets.all(10),
         width: 225,
         height: 74,
         margin: EdgeInsets.only(bottom: 20),
         decoration: BoxDecoration(
           color: backgroundColor6,
           borderRadius: BorderRadius.circular(12),
           border: Border.all(
             color: primaryColor
           )
         ),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.asset("assets/image_shoes.png")),
             SizedBox(width: 10,),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("COURT VISIO... asda sdsa  asd a" , style: primaryTextStyle, overflow: TextOverflow.ellipsis,),
                   SizedBox(height: 2,),
                   Text("\$57,15", style: priceTextStyle.copyWith(fontWeight: medium),)
                 ],
               ),
             ),
             SizedBox(width: 6,),
             Image.asset("assets/button_close.png", width: 22,)
           ],
         ),
       );
     }

     Widget chatInput(){
       return Container(
         margin: EdgeInsets.all(20),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             productPreview(),
             Row(
               children: [
                 Expanded(
                   child: Container(
                     height: 45,
                     padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                     child: TextFormField(
                       style: primaryTextStyle.copyWith(fontWeight: regular),
                       decoration: InputDecoration.collapsed(
                         hintStyle: subtitleTextStyle.copyWith(fontWeight: regular, fontSize: 14),
                         hintText: "Type message..."
                       ),
                     ),
                     decoration: BoxDecoration(
                       color: backgroundColor4,
                       borderRadius: BorderRadius.circular(12)
                     ),

                   ),
                 ),
                 SizedBox(width: 20,),
                 Image.asset("assets/button_send.png", width: 45,)
               ],
             ),
           ],
         ),
       );
     }

     Widget content(){
       return ListView(
         padding: EdgeInsets.symmetric(horizontal: defaultMargin),
         children: [
           ChatBubble(isSender: true, text: "Hi, This item is still available?",hasProduct: true,),
           ChatBubble(isSender: false, text: "Good night, This item is only available in size 42 and 43"),
         ],
       );
     }



     
     
     return Scaffold(
       backgroundColor: backgroundColor3,
       appBar: header(),
       bottomNavigationBar: chatInput(),
       body: content(),
     );
   }
 }
 