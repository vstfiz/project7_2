import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom/globals.dart';

class ChatMessage {
  String messageContent;
  String messageType;

  ChatMessage({@required this.messageContent, @required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];

class ChatScreenSingle extends StatefulWidget {
  String userName;


  ChatScreenSingle({this.userName});

  @override
  _ChatScreenSingleState createState() => _ChatScreenSingleState();
}

class _ChatScreenSingleState extends State<ChatScreenSingle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFF0F0F0F),

      elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  SizedBox(width: 2,),
                  CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pinimg.com/550x/e8/ee/ff/e8eeff76c7609875d3a6bb6f8c528862.jpg"),
                    maxRadius: 20,
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(this.widget.userName, style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Globals.getFontSize(16),
                        fontWeight: FontWeight.w600),),
                        SizedBox(height: 6,),
                        Text("Online", style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: Globals.getFontSize(13),
                            fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
        body:Container(
          color:  Color(0xFF0F0F0F),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10,bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType  == "receiver"?Colors.grey:Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child:Text(messages[index].messageContent, style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: Globals.getFontSize(16),
                            fontWeight: FontWeight.w400),),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                  height: 60,
                  width: double.infinity,
                  color:Color(0xFF0F0F0F),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(Icons.add, color: Colors.white, size: 20, ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: TextField(
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: Globals.getFontSize(16),
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      FloatingActionButton(
                        onPressed: (){},
                        child: Icon(Icons.send,color: Colors.white,size: 18,),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],

                  ),
                ),
              ),
            ],
          ),
        ),
    );



    //     Stack(children: <Widget>[
    //   ListView.builder(
    //     itemCount: messages.length,
    //     shrinkWrap: true,
    //     padding: EdgeInsets.only(top: 10, bottom: 10),
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) {
    //       return Container(
    //         padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
    //         child: Text(messages[index].messageContent, style: GoogleFonts.montserrat(
    //             color: Colors.white,
    //             fontSize: Globals.getFontSize(16),
    //             fontWeight: FontWeight.w400),
    //         ),
    //       );
    //     },
    //   ),
    // ])
  }
}
