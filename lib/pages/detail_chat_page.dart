import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/services/message_service.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

import '../providers/auth_provider.dart';


 class DetailChatPage extends StatefulWidget {

   ProductModel product;
   DetailChatPage(this.product);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {

  TextEditingController messageController = TextEditingController(text: '');

   @override
   Widget build(BuildContext context) {
     AuthProvider authProvider = Provider.of<AuthProvider>(context);

     handleAddMessage() async{
       await MessageService().addMessage(
           user: authProvider.user,
           isFromUser: true,
           product: widget.product,
           message: messageController.text
       );
       setState(() {
         widget.product = UninitializedProductsModel();
         messageController.text='';
       });
     }

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
             ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(widget.product.galleries![0].url)),
             SizedBox(width: 10,),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(widget.product.name! , style: primaryTextStyle, overflow: TextOverflow.ellipsis,),
                   SizedBox(height: 2,),
                   Text("\$${widget.product.price}", style: priceTextStyle.copyWith(fontWeight: medium),)
                 ],
               ),
             ),
             SizedBox(width: 6,),
             GestureDetector(onTap: (){
               setState(() {
                 widget.product = UninitializedProductsModel();
               });
             },child: Image.asset("assets/button_close.png", width: 22,))
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
             widget.product is UninitializedProductsModel? SizedBox():productPreview(),
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
                       controller: messageController,

                     ),
                     decoration: BoxDecoration(
                       color: backgroundColor4,
                       borderRadius: BorderRadius.circular(12)
                     ),

                   ),
                 ),
                 SizedBox(width: 20,),
                 GestureDetector(onTap: handleAddMessage,child: Image.asset("assets/button_send.png", width: 45,))
               ],
             ),
           ],
         ),
       );
     }

     Widget content(){
       return StreamBuilder<List<MessageModel>>(
         stream: MessageService().getMessagesByUserId(userId: authProvider.user.id),
         builder: (context, snapshot) {

           if(snapshot.hasData){
             return ListView(
               padding: EdgeInsets.symmetric(horizontal: defaultMargin),
               children: snapshot.data!.map((MessageModel message) => ChatBubble(
                 isSender: message.isFromUser!,
                 text: message.message!,
                 product: message.product!,
               )).toList(),
             );
           }
           else{
             return Center(child: CircularProgressIndicator(),);
           }


         }
       );
     }





     return Scaffold(
       backgroundColor: backgroundColor3,
       appBar: header(),
       bottomNavigationBar: chatInput(),
       body: content(),
       resizeToAvoidBottomInset: false,
     );
   }
}
 