import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project7_2/custom/globals.dart';
import 'package:project7_2/view/fill_details/get_pass.dart';
import 'package:project7_2/view/request_permissions/request_permissions.dart';
import 'package:toast/toast.dart';

class FillDetails extends StatefulWidget {
  _FillDetailsState createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
  String usernameError = null;
  TextEditingController _firstameController = new TextEditingController();
  TextEditingController _secondnameController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  String date = 'DOB';
  DateTime selectedDate;

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
    {
      selectedDate = picked;
      String time = picked.toString().substring(0,10).replaceAll('-', '/');
      setState(() {
        date = time;
      });
    }
  }

  Future<void> _loadingDialog(String value) {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            backgroundColor: Colors.white,
            content: Container(
                height: 60,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                            fontFamily: "Livvic",
                            fontSize: 23,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ))));
  }


  @override
  Widget build(BuildContext context) {
    double h = Globals.height;
    double w = Globals.width;
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: h,
                  width: w,
                ),
                Positioned(
                  child: IconButton(
                    icon: new Image.asset('assets/images/back_flip.png'),
                    iconSize: 40,
                  ),
                  left: w * 0.05,
                  top: h * 0.01,
                ),
                Positioned(
                  top: h * 0.1,
                  left: w * 0.1,
                  child: Text('Hi, tell us a little \nbit about \nyourself',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                ),
                Positioned(
                  child: Container(
                    height: h * 0.05,
                    width: w * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey)),
                    child: TextField(
                      controller: _firstameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  top: h * 0.3,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                    height: h * 0.05,
                    width: w * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey)),
                    child: TextField(
                      controller: _secondnameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Second Name',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  top: 1+ h * 0.35 ,
                  left: w * 0.05,
                ),
                Positioned(
                  child:GestureDetector(
                    onTap: (){
                      _selectDate(context);
                    },
                    child:  Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(width: 1.0, color: Colors.grey)),
                      child: Text(date,
                      ),
                    ),
                  ),
                  top: 2+ h * 0.4,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                    height: h * 0.05,
                    width: w * 0.9,
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey)),
                    child: TextField(
                      controller: _genderController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Gender',
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  top: 3+ h * 0.45,
                  left: w * 0.05,
                ),
                Positioned(
                  child: Container(
                    height: usernameError==null?h * 0.05:h * 0.08,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1.0, color: Colors.grey)),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        border: InputBorder.none,
                        hintText: 'E-Mail',
                        errorText: usernameError,
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        suffix: TextButton(
                          onPressed: (){
                            if(!EmailValidator.validate(_usernameController.text)){
                              setState(() {
                                usernameError = 'Enter a valid e-mail.';
                              });
                            }
                            else{
                              setState(() {
                                usernameError = null;
                              });
                            }
                          },
                          child: Text('Choose',style: TextStyle(color: Colors.grey,fontSize: 12)),
                        )
                      ),
                    ),
                  ),
                  top: h * 0.6,
                  left: w * 0.05,
                ),
                Positioned(
                    top: h * 0.75,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {
                           if(_firstameController.text!=''){
                             if(_secondnameController.text!=''){
                               if(date!='' || date!= null || date!='DOB'){
                                 if(_genderController.text!= ''){
                                   if(EmailValidator.validate(_usernameController.text)){
                                     setState(() {
                                       Globals.name = _firstameController.text + _secondnameController.text;
                                       Globals.email = _usernameController.text;
                                       Globals.dob = date;
                                     });
                                     Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                                       return GetPass();
                                     }));

                                   }
                                   else{
                                     Toast.show('PLease enter a valid e-mail', context);
                                   }
                                 }
                                 else{
                                   Toast.show('Please enter value in gender', context);
                                 }
                               }
                               else{
                                 Toast.show('Please select your date of birth', context);
                               }
                             }
                             else{
                               Toast.show('Please Enter value in Second Name', context);
                             }
                           }
                           else{
                             Toast.show('PLease enter value in First Name',context);
                           }
                        },
                        child:
                            Text('Next', style: TextStyle(color: Colors.white)),
                      ),
                    )),
                Positioned(
                    top: h * 0.85,
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      color: Colors.grey,
                      child: TextButton(
                        onPressed: () {
                          if(EmailValidator.validate(_usernameController.text)){
                            setState(() {
                              Globals.email = _usernameController.text;
                            });
                            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context){
                              return GetPass();
                            }));
                          }
                          else{
                            Toast.show('PLease enter a valid e-mail', context);
                          }
                        },
                        child:
                            Text('Skip', style: TextStyle(color: Colors.white)),
                      ),
                    )),
              ],
            )),
        onWillPop: () {
          return Future.value(false);
        });
  }
}
