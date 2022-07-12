import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/model/event_request.dart';
import 'package:project7_2/model/invites.dart';

import '../../../custom/globals.dart';


class Status extends StatefulWidget{
  @override
  _StatusState createState ()=> _StatusState();
}

class _StatusState extends State<Status>{

  List<EventRequest> requests =[];

  List<String> texts = [];
  List<String> icons = [];
  
  bool isOverviewSelected = true;
  bool isAcceptedSelected = false;
  bool isInProgressSelected = false;

  @override
  void initState() {
    texts.add('Statistics');
    texts.add('Status');
    texts.add('Mates');
    icons.add('assets/images/left_panel/statistics.png');
    icons.add('assets/images/status.png');
    icons.add('assets/images/mates.png');
    requests.add(EventRequest(imagePath: 'assets/images/left_panel/profile_image.png',name: 'Vivek Sharma',requestType: 'accepted'));
    requests.add(EventRequest(imagePath: 'assets/images/left_panel/profile_image.png',name: 'Vivek Sharma',requestType: 'inprogress'));
    requests.add(EventRequest(imagePath: 'assets/images/left_panel/profile_image.png',name: 'Vivek Sharma',requestType: 'accepted'));
    requests.add(EventRequest(imagePath: 'assets/images/left_panel/profile_image.png',name: 'Vivek Sharma',requestType: 'inprogress'));
    requests.add(EventRequest(imagePath: 'assets/images/left_panel/profile_image.png',name: 'Vivek Sharma',requestType: 'inprogress'));
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121217),
        actions: [
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
              ),
              child: Text(
                'Status',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: Globals.getFontSize(22),
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w600),
              )),
          SizedBox(
            width: 100,
          ),
          Container(
            width: Globals.width * 0.15,
            height: Globals.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF5D6CDF),
            ),
            child: GestureDetector(
              onTap: () {
                Globals.currentTab = 3;
                Globals.pageController.jumpToPage(3);
              },
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      backgroundColor: Color(0xFF121217),
      body: Stack(
        children: [
          Positioned(top: 0.0,left:0.0,child: Container(
            height: Globals.getHeight(450),
            width: Globals.width,
            child: isOverviewSelected?overviewWidget():isAcceptedSelected?acceptedWidget():inprogressWidget(),
          )),
          Positioned(
              top: Globals.getHeight(540),
              width: Globals.width - 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: Globals.getWidth(28)),
                      height: Globals.getHeight(35),
                      decoration: BoxDecoration(
                          border: isOverviewSelected
                              ? Border.all(
                              color: Color(0xFF7585FF), width: 1.30)
                              : null,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Overview',
                        style: GoogleFonts.montserrat(
                            color: isOverviewSelected
                                ? Colors.white
                                : Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(16),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isOverviewSelected = true;
                        isAcceptedSelected = false;
                        isInProgressSelected = false;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: Globals.getWidth(28)),
                      height: Globals.getHeight(35),
                      decoration: BoxDecoration(
                          border: isAcceptedSelected
                              ? Border.all(
                              color: Color(0xFF7585FF), width: 1.30)
                              : null,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Accepted',
                        style: GoogleFonts.montserrat(
                            color: isAcceptedSelected
                                ? Colors.white
                                : Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(16),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isOverviewSelected = false;
                        isAcceptedSelected = true;
                        isInProgressSelected = false;
                      });
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: Globals.getWidth(28)),
                      height: Globals.getHeight(35),
                      decoration: BoxDecoration(
                          border: isInProgressSelected
                              ? Border.all(
                              color: Color(0xFF7585FF), width: 1.30)
                              : null,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'In Progress',
                        style: GoogleFonts.montserrat(
                            color: isInProgressSelected
                                ? Colors.white
                                : Color(0xFf6C7B8A),
                            fontSize: Globals.getFontSize(16),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isOverviewSelected = false;
                        isAcceptedSelected = false;
                        isInProgressSelected = true;
                      });
                    },
                  )
                ],
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

  Widget overviewWidget(){
    return ListView(children: List.generate(requests.length, (index) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Image.asset(requests[index].imagePath,height: Globals.getHeightLeftPanel(40),width: Globals.getWidth(40),),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: Globals.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextButton(
                      child:  Text(
                        requests[index].name,
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    'Message',
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Globals.getWidth(25.0)),
                  border: Border.all(
                      color: requests[index].requestType=='accepted'?Colors.green:Color(0XFF7585FF),
                      width: 1.0
                  )
              ),
              child: TextButton(
                child: Text(
                  requests[index].requestType=='accepted'?'Accepted':'Requested',
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
    }),);
  }
  Widget acceptedWidget(){
    return ListView(children: List.generate(requests.length, (index) {
      return requests[index].requestType=='accepted'? Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Image.asset(requests[index].imagePath,height: Globals.getHeightLeftPanel(40),width: Globals.getWidth(40),),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: Globals.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextButton(
                      child:  Text(
                        requests[index].name,
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    'Message',
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Globals.getWidth(25.0)),
                  border: Border.all(
                      color: requests[index].requestType=='accepted'?Colors.green:Color(0XFF7585FF),
                      width: 1.0
                  )
              ),
              child: TextButton(
                child: Text(
                  requests[index].requestType=='accepted'?'Accepted':'Requested',
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
      ):SizedBox();
    }),);
  }
  Widget inprogressWidget(){
    return ListView(children: List.generate(requests.length, (index) {
      return requests[index].requestType=='inprogress'? Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Image.asset(requests[index].imagePath,height: Globals.getHeightLeftPanel(40),width: Globals.getWidth(40),),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: Globals.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextButton(
                      child:  Text(
                        requests[index].name,
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    'Message',
                    style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Globals.getWidth(25.0)),
                  border: Border.all(
                      color: requests[index].requestType=='accepted'?Colors.green:Color(0XFF7585FF),
                      width: 1.0
                  )
              ),
              child: TextButton(
                child: Text(
                  requests[index].requestType=='accepted'?'Accepted':'Requested',
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
      ):SizedBox();
    }),);
  }
}