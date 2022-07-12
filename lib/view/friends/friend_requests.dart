import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/model/invites.dart';

import '../../custom/globals.dart';
import '../new_ui/search/search_edit.dart';

class FriendRequests extends StatefulWidget{
  @override
  _FriendRequestsState createState ()=> _FriendRequestsState();
}

class _FriendRequestsState extends State<FriendRequests>{

  List<InviteFriend> invites = List.filled(10, InviteFriend(imagePath: '',name: 'Vivek Sharma',buttonText: 'Add Friend',isInvited: false),growable: true);
  List<String> texts = [];
  List<String> icons = [];

  @override
  void initState() {
    texts.add('Statistics');
    texts.add('Status');
    texts.add('Mates');
    icons.add('assets/images/left_panel/statistics.png');
    icons.add('assets/images/status.png');
    icons.add('assets/images/mates.png');
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Color(0xFF121217),
        actions: [
          SizedBox(
            width: 50,
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                return SearchEdit();
              }));
            },
            child: Icon(Icons.search,color: Colors.white,size: 24,),

          ),
          SizedBox(
            width: 20,
          ),
        ],

      ),
        backgroundColor: Color(0xFF121217),
      body: Stack(
        children: [
          Positioned(top: 0.0,left:0.0,child: Container(
            height: Globals.height * 0.65,
            width: Globals.width,
            child: ListView(children: List.generate(invites.length, (index) {
            return Container(

              width: Globals.width,
              height: Globals.getHeight(80),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5
                  )
                )
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Image.asset('assets/images/left_panel/profile_image.png',height: Globals.getHeightLeftPanel(40),width: Globals.getWidth(40),),
                  SizedBox(
                    width: 10.0,
                  ),
                 Container(
                   width: Globals.width * 0.55,
                   child:  Text(
                     'Vivek Sharma',
                     style: GoogleFonts.montserrat(
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                         color: Colors.white
                     ),
                     textAlign: TextAlign.left,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: invites[index].isInvited?Colors.transparent:Colors.pink,
                      borderRadius: BorderRadius.circular(Globals.getWidth(25.0)),
                      border: Border.all(
                        color: Colors.pink,
                        width: 1.0
                      )
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          invites[index].isInvited = !invites[index].isInvited;
                        });
                      },
                      child: Text(
                        invites[index].isInvited?'Sent':'Request',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ),

                  ),
                  SizedBox(
                    width: 20.0,
                  )
                ],
              ),
            );
          }),),
          )),
          Positioned(
            child: Container(
              child: Column(
                children: List.generate(3, (index){
                  return Container(
                    width: Globals.width,
                    margin: EdgeInsets.symmetric(vertical: Globals.getHeight(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: Globals.getWidth(15),),
                        Container(
                          width: Globals.getWidth(20),
                          height: Globals.getHeight(20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      icons[index]),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(width: Globals.getWidth(38.78),),
                        Text(
                          texts[index],
                          style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Globals.getFontSize(20)),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              width: Globals.width,
              height: Globals.getHeight(215),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Globals.getWidth(8.57)),
              ),
            ),
            bottom: Globals.getHeight(0),
          ),

        ],
      ),
    );
  }
}