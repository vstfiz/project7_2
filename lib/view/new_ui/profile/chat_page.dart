import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom/globals.dart';
import 'chat_users.dart';
import 'conversation_list.dart';

class ChatPage extends StatefulWidget{
  @override
  _ChatPageState createState()=> _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "Now",),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageURL: "https://dpwhatsapp.xyz/wp-content/uploads/2021/06/Cristiano-Ronaldo-Facebook-DP.jpg", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                  ],
                ),
              ),
            ),
            Container(
              height: 800,
              width: Globals.width,
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageUrl: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3)?true:false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}