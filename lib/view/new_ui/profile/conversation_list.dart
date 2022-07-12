import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/view/new_ui/profile/chat_screen_single.dart';

import '../../../custom/globals.dart';

class ConversationList extends StatefulWidget{
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList({@required this.name,@required this.messageText,@required this.imageUrl,@required this.time,@required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){return ChatScreenSingle(userName: 'Rahul Dev Garg',);}));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.name,style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: Globals.getFontSize(18),

                              fontWeight: FontWeight.w500),),
                          SizedBox(height: 6,),
                          Text(widget.messageText,style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: Globals.getFontSize(13),
                              fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.time,style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: Globals.getFontSize(12),
                fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}