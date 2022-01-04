import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/new_ui/onboarding/login.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

import 'gender.dart';
import 'lockerroom_welcome.dart';

class Data extends StatefulWidget {
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _dobController = new TextEditingController();
  File _file;
  String uri = 'Image';
  String imageName;
  var uuid = Uuid();
  RegExp _dobRegex = new RegExp(r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');
String _defaultAddress = 'https://raw.githubusercontent.com/vstfiz/vstfiz.github.io/master/images/';

  Future<void> _loadingDialog(String value) {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            content: Container(
                height: Globals.getHeight(80),
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Uploading image'.toUpperCase(),style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize:Globals.getFontSize(20),letterSpacing: 1.6),),

                        Container(child:  LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                        ),width: Globals.getWidth(200))
                      ],
                    )
                ))));
  }


  Future<String> _uploadImage(File file) async {
    print("image upload running");
    final Reference ref = FirebaseStorage.instance.ref().child(
        'users/${uuid.v4()}.jpg');
    final UploadTask uploadTask = ref.putFile(file);
    await uploadTask;
    var uri = await ref.getDownloadURL();
    print(uri.toString());
    return uri.toString();
  }

  Future getCameraImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _file = File(pickedFile.path);
    });
    Navigator.pop(context);}

  Future getGalleryImage() async {
    final picker = ImagePicker();
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _file = File(pickedFile.path);
    });
    Navigator.pop(context);
  }

  Future _imagePickerDialog(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Globals.getWidth(0.1))
          ),
          height: Globals.getHeight(100),
          width: Globals.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(onTap:(){getCameraImage();},child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera, size: 24, color: Colors.white,),
                  SizedBox(
                    width: Globals.getWidth(40),
                  ),
                  Text('Camera'.toUpperCase(), style: GoogleFonts.montserrat(
                      fontSize: Globals.getFontSize(16),
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.8))
                ],
              ),),
              SizedBox(
                height: Globals.getHeight(50),
              ),
             GestureDetector(
               onTap: (){
                 getGalleryImage();
               },
               child:  Row(
                 mainAxisAlignment: MainAxisAlignment.center,

                 children: [
                   Icon(Icons.image, size: 24, color: Colors.white,),
                   SizedBox(
                     width: Globals.getWidth(40),
                   ),
                   Text('Gallery'.toUpperCase(), style: GoogleFonts.montserrat(
                       fontSize: Globals.getFontSize(16),
                       color: Colors.white,
                       fontWeight: FontWeight.w300,
                       letterSpacing: 1.8))
                 ],
               ),
             )
            ],
          ),

        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  _userNameController.text = Globals.creationEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Globals.getHeight(1200),
        width: Globals.width,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: Globals.getHeight(1200),
                width: Globals.width,
              ),
              Positioned(
                  top: Globals.getHeight(392),
                  child: Container(
                    child: AutoSizeText(
                      'Let\'s talk about you',
                      minFontSize: 26,
                      maxFontSize: 30,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(26),
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(486),
                  left: Globals.getWidth(25),
                  child: Container(
                    child: AutoSizeText(
                      'Email Address',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w300),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(518),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      controller: _userNameController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        hintText: 'Enter your email address',
                        hintStyle: GoogleFonts.montserrat(
                            color: Color(0xFF6C7B8A),
                            fontSize: Globals.getFontSize(18),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius:
                        BorderRadius.circular(Globals.getWidth(10))),
                  )),
              Positioned(
                  top: Globals.getHeight(606),
                  left: Globals.getWidth(25),
                  child: Container(
                    child: AutoSizeText(
                      'First Name',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w300),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(637),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      controller: _firstNameController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        hintText: 'Enter your first name',
                        hintStyle: GoogleFonts.montserrat(
                            color: Color(0xFF6C7B8A),
                            fontSize: Globals.getFontSize(18),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius:
                        BorderRadius.circular(Globals.getWidth(10))),
                  )),
              Positioned(
                  top: Globals.getHeight(727),
                  left: Globals.getWidth(25),
                  child: Container(
                    child: AutoSizeText(
                      'Last Name',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w300),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(759),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      controller: _lastNameController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        hintText: 'Enter your last name',
                        hintStyle: GoogleFonts.montserrat(
                            color: Color(0xFF6C7B8A),
                            fontSize: Globals.getFontSize(18),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius:
                        BorderRadius.circular(Globals.getWidth(10))),
                  )),
              Positioned(
                  top: Globals.getHeight(851),
                  left: Globals.getWidth(25),
                  child: Container(
                    child: AutoSizeText(
                      'Date Of Birth',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w300),
                    ),
                  )),
              Positioned(
                  top: Globals.getHeight(886),
                  left: Globals.width * 0.05,
                  child: Container(
                    height: Globals.getHeight(58),
                    width: Globals.width * 0.9,
                    child: TextField(
                      controller: _dobController,
                      // textAlignVertical: TextAlignVertical.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: Globals.getFontSize(16),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.3),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 20),
                        hintText: 'DD/MM/YYYY',
                        hintStyle: GoogleFonts.montserrat(
                            color: Color(0xFF6C7B8A),
                            fontSize: Globals.getFontSize(18),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.3),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFF121217),
                        borderRadius:
                        BorderRadius.circular(Globals.getWidth(10))),
                  )),
              Positioned(
                  top: Globals.getHeight(1052),
                  left: Globals.width * 0.22,
                  child: Container(
                    height: Globals.getHeight(50),
                    width: Globals.width * 0.56,
                    child: TextButton(
                      onPressed: () async{
                       if(_file != null){
                         if(EmailValidator.validate(_userNameController.text)){
                           if(_firstNameController.text!=''){
                             if(_lastNameController.text!=''){
                               if(_dobRegex.hasMatch(_dobController.text)){
                                 _loadingDialog('sdf');
                                 await _uploadImage(_file);

                                 setState(() {
                                   Globals.creationName = _firstNameController.text + _lastNameController.text;
                                   Globals.creationEmail = _userNameController.text;
                                   Globals.creationDob = _dobController.text;
                                   Navigator.pop(context);
                                   Navigator.of(context).pushReplacement(PageTransition(
                                       type: PageTransitionType.rightToLeft,
                                       child: SelectGender(),
                                       duration: new Duration(milliseconds: 300),
                                       curve: Curves.easeInOut));

                                 });
                               }else{
                                 Toast.show('Enter valid Date Of Birth in DD/MM/YYYY format', context);

                               }
                             }else{
                               Toast.show('Enter enter value in Last Name', context);

                             }
                           }
                           else{
                             Toast.show('Enter enter value in First Name', context);

                           }
                         }
                         else{
                           Toast.show('Enter valid email address', context);
                         }
                       }
                       else{

                         if(EmailValidator.validate(_userNameController.text)){
                           if(_firstNameController.text!=''){
                             if(_lastNameController.text!=''){
                               if(_dobRegex.hasMatch(_dobController.text)){
                                 _loadingDialog('sdf');
                                 setState(() {
                                   Globals.creationDp = _defaultAddress + _firstNameController.text[0] + '.png';
                                   Globals.creationName = _firstNameController.text + _lastNameController.text;
                                   Globals.creationEmail = _userNameController.text;
                                   Globals.creationDob = _dobController.text;
                                   Navigator.pop(context);
                                   Navigator.of(context).pushReplacement(PageTransition(
                                       type: PageTransitionType.rightToLeft,
                                       child: SelectGender(),
                                       duration: new Duration(milliseconds: 300),
                                       curve: Curves.easeInOut));
                                 });
                               }else{
                                 Toast.show('Enter valid Date Of Birth in DD/MM/YYYY format', context);

                               }
                             }else{
                               Toast.show('Enter enter value in Last Name', context);

                             }
                           }
                           else{
                             Toast.show('Enter enter value in First Name', context);

                           }
                         }
                         else{
                           Toast.show('Enter valid email address', context);
                         }
                       }
                      },
                      child: Text(
                        'Next'.toUpperCase(),
                        style: GoogleFonts.montserrat(
                            fontSize: Globals.getFontSize(17),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2.89,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                        BorderRadius.circular(Globals.getWidth(48))),
                  )),
              Positioned(
                  top: Globals.getHeight(108),
                  left: Globals.getWidth(71),
                  child: Container(
                    width: Globals.getWidth(268),
                    height: Globals.getHeight(268),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/layer.png'),
                            fit: BoxFit.contain)),
                  )),
              Positioned(
                  top: Globals.getHeight(125),
                  left: Globals.getWidth(86),
                  child: Container(
                    width: Globals.getWidth(238),
                    height: Globals.getHeight(235),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/layer_2.png'),
                            fit: BoxFit.scaleDown)),
                  )),
              Positioned(
                  top: Globals.getHeight(141),
                  left: Globals.getWidth(106),
                  child: Container(
                    width: Globals.getWidth(200),
                    height: Globals.getHeight(200),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/onboarding/layer_3.png'),
                            fit: BoxFit.scaleDown)),
                  )),
              _file == null ? Positioned(
                  top: Globals.getHeight(169),
                  left: Globals.getWidth(151),
                  child: GestureDetector(
                    onTap: (){_imagePickerDialog(context);},
                    child: Container(
                      width: Globals.getWidth(112),
                      height: Globals.getHeight(137),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/onboarding/person_male.png'),
                              fit: BoxFit.scaleDown)),
                    ),
                  )) :
              Positioned(
                  top: Globals.getHeight(139),
                  left: Globals.getWidth(104),
                  child: Container(
                      width: Globals.getWidth(205),
                      height: Globals.getHeight(205),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(_file),
                              fit: BoxFit.cover
                          )))),
              Positioned(
                  top: Globals.getHeight(290),
                  right: Globals.getWidth(95),
                  child: GestureDetector(
                    onTap: () {
                      _imagePickerDialog(context);
                    },
                    child: Container(
                      width: Globals.getWidth(40),
                      height: Globals.getHeight(40),
                      child: Center(
                        child: Container(
                          width: Globals.getWidth(20),
                          height: Globals.getHeight(20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage(
                                      'assets/images/onboarding/edit.png'),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF000000), Color(0xFF7585FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
    );
  }
}
