import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/clipped_profile/clipped_profile.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/model/chat_messages.dart';
import 'package:project7_2/view/new_ui/fields/badminton.dart';
import 'dart:math' as math;

import 'package:project7_2/view/new_ui/fields/basketball.dart';

class ChatScreen extends StatefulWidget {
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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

  // SpeechToText speech = SpeechToText();
  // bool _hasSpeech = false;
  // double level = 0.0;

  int getRandomIndex(int max) {
    math.Random r = new math.Random();
    return r.nextInt(max);
  }

  List<Color> colors = [
    Color(0xFFFF3A79),
    Color(0xFF1DCECB),
    Color(0xFFA573FF)
  ];

  String _lastWords = '';

  @override
  void initState() {
    // initSpeechState();
    _bodyStack = _chatStack();
    super.initState();
  }

  // Future<void> initSpeechState() async {
  //   print('wait');
  //   var hasSpeech = await speech.initialize(
  //     debugLogging: false,
  //   );
  //   if (!mounted) return;
  //   setState(() {
  //     _hasSpeech = hasSpeech;
  //   });
  //   print(hasSpeech);
  // }

  // void startListening() {
  //   print('wafdsef');
  //   _lastWords = '';
  //   speech.listen(
  //       onResult: resultListener,
  //       listenFor: Duration(seconds: 30),
  //       pauseFor: Duration(seconds: 5),
  //       partialResults: true,
  //       localeId: 'en-US',
  //       onSoundLevelChange: soundLevelListener,
  //       cancelOnError: true,
  //       listenMode: ListenMode.confirmation);
  //   setState(() {});
  // }
  //
  // void stopListening() {
  //   speech.stop();
  //   setState(() {
  //     _messageController.text =
  //         (_messageController.text + " " + _lastWords).trim();
  //     _lastWords = '';
  //     level = 0.0;
  //   });
  // }
  //
  // void cancelListening() {
  //   speech.cancel();
  //   setState(() {
  //     level = 0.0;
  //   });
  // }
  //
  // void resultListener(SpeechRecognitionResult result) {
  //   print('waiiiiiiiiit');
  //   setState(() {
  //     _lastWords += '${result.recognizedWords}';
  //   });
  // }
  //
  // void soundLevelListener(double level) {
  //   setState(() {
  //     this.level = level;
  //   });
  // }

  TextEditingController _messageController = TextEditingController();
  bool isMenuOpen = false;
  List<String> options = ['Game info', 'lineup', 'team mates', 'leave room'];
  FocusNode _focusNode = FocusNode();
  var _bodyStack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF0F0F0F),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Rubin's Locker",
                        style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                isMenuOpen
                    ? SizedBox()
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context)
                                .push(new MaterialPageRoute(
                                builder: (context) {
                                  return BadmintonField();
                                }));
                          },
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                        )


                        // PopupMenuButton(
                        //     icon: Icon(
                        //       Icons.more_vert,
                        //       color: Colors.white,
                        //     ),
                        //     color: Colors.black,
                        //     itemBuilder: (_) =>
                        //         List.generate(options.length, (index) {
                        //           return PopupMenuItem<String>(
                        //             child: Container(
                        //               color: Colors.black,
                        //               child: Row(
                        //                 children: [
                        //                   SizedBox(
                        //                     width: 10,
                        //                   ),
                        //                   Icon(
                        //                     Icons.notifications,
                        //                     color: Colors.white,
                        //                     size: 12,
                        //                   ),
                        //                   SizedBox(
                        //                     width: 20,
                        //                   ),
                        //                   Text(
                        //                     options[index].toUpperCase(),
                        //                     style: GoogleFonts.montserrat(
                        //                         fontSize: 12,
                        //                         fontWeight: FontWeight.w500,
                        //                         color: Colors.white),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //             onTap: () {
                        //
                        //             },
                        //           );
                        //         }))

                        // TextButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       isMenuOpen = !isMenuOpen;
                        //     });
                        //   },
                        //   child: Icon(
                        //     Icons.more_vert,
                        //     color: Colors.white,
                        //   ),
                        //   style: ButtonStyle(
                        //       overlayColor: MaterialStateProperty.all(
                        //           Color(0xFFC4C4C4).withOpacity(0.11)),
                        //       shape:
                        //           MaterialStateProperty.all<RoundedRectangleBorder>(
                        //         RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(50.0),
                        //             side: BorderSide(color: Colors.transparent)),
                        //       )),
                        // ),
                        )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF0F0F0F),
      body: isMenuOpen ? _lineUpStack() : _chatStack(),
    );
  }

  Widget _chatStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
              width: Globals.width,
              height: Globals.getHeight(100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '4 Team Members',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF585858)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return ClippedProfileContainer(
                        imageUrl: 'assets/images/left_panel/profile_image.png',
                        height: Globals.getWidth(50),
                        width: Globals.getWidth(50),
                      );
                    }),
                  ),
                ],
              )),
          top: 0.0,
        ),
        Positioned(
          child: Container(
            width: Globals.width,
            height: Globals.height - Globals.getHeight(160),
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors[getRandomIndex(3)],
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          top: Globals.getHeight(100),
          left: 0.0,
        ),
        Positioned(
          child: Container(
            width: Globals.width,
            height: Globals.getHeight(90.14),
            padding: EdgeInsets.only(top: 22.18),
            decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(width: 1, color: Color(0xFF3F3E3E))),
              color: Color(0xFF0F0F0F),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: Globals.getWidth(27),
                ),
                Container(
                  height: Globals.getHeight(50),
                  width: Globals.getWidth(253),
                  child: TextField(
                    focusNode: _focusNode,
                    textAlignVertical: TextAlignVertical.center,
                    controller: _messageController,
                    style: GoogleFonts.montserrat(
                        color: Color(0xFFF4F6F9),
                        fontSize: Globals.getFontSize(14)),
                    decoration: InputDecoration(
                      hintText: "Write message...",
                      hintStyle: GoogleFonts.montserrat(color: Colors.white),
                      contentPadding:
                          EdgeInsets.only(left: Globals.getWidth(20.0)),
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                        onLongPress: () {
                          print(1);
                          // startListening();
                        },
                        onLongPressEnd: (val) {
                          print(2);
                          // stopListening();
                        },
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF1E1E1E),
                      borderRadius:
                          BorderRadius.circular(Globals.getWidth(32.0))),
                ),
                SizedBox(
                  width: Globals.getWidth(12),
                ),
                Container(
                  height: Globals.getHeight(50),
                  width: Globals.getWidth(93),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          messages.add(new ChatMessage(
                              messageContent: _messageController.text,
                              messageType: "sender"));
                        });
                        _messageController.clear();
                        _focusNode.unfocus();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: -math.pi / 6,
                            child: Icon(
                              Icons.send,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: Globals.getWidth(15.0),
                          ),
                          Text(
                            'Send',
                            style: GoogleFonts.montserrat(
                              fontSize: Globals.getFontSize(14.0),
                              color: Colors.grey,
                            ),
                          )
                        ],
                      )),
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(Globals.getWidth(32.0)),
                  ),
                )
              ],
            ),
          ),
          bottom: 0.0,
          left: 0.0,
        ),
      ],
    );
  }

  Widget _lineUpStack() {
    return Stack(
      children: [
        Positioned(
          child: Container(
              width: Globals.width,
              height: Globals.getHeight(100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '4 Team Members',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xFF585858)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      return ClippedProfileContainer(
                        imageUrl: 'assets/images/left_panel/profile_image.png',
                        height: Globals.getWidth(50),
                        width: Globals.getWidth(50),
                      );
                    }),
                  ),
                ],
              )),
          top: 0.0,
        ),
        Positioned(
          child: TextButton(
            onPressed: () {
              setState(() {
                _bodyStack = _chatStack();
                isMenuOpen = false;
              });
            },
            child: Icon(
              Icons.clear,
              color: Colors.white,
              size: 20,
            ),
          ),
          right: 0.0,
          top: Globals.getHeight(80),
        ),
        Positioned(
          child: Container(
            width: Globals.width,
            height: Globals.getHeight(750),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fieldFootball.png'),
                    fit: BoxFit.contain)),
          ),
          top: Globals.getHeight(100),
        )
      ],
    );
  }
}
