import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/view/new_ui/search/search_result_page.dart';

import '../../../custom/globals.dart';



class SearchEdit extends StatefulWidget {
  @override
  _SearchEditState createState() => _SearchEditState();
}

class _SearchEditState extends State<SearchEdit> {
  TextEditingController _searchController = new TextEditingController();
  var queryResults = [];
  var tempStorage = [];

  _getData() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .get();
    querySnapshot.docs.forEach((element) {
      print(element.toString());
      print('result');
      queryResults.add(element);
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // startSearch(String query) async {
  //   if (query.length == 0) {
  //     setState(() {
  //       queryResults = [];
  //       tempStorage = [];
  //     });
  //   }
  //   if(query.length == 1){
  //     List<QueryDocumentSnapshot> qds = await SearchService().searchSingle(query);
  //     qds.forEach((element) {
  //       tempStorage.add(element);
  //     });
  //   }
  //   else{
  //     List<QueryDocumentSnapshot> qds = await SearchService().searchCompound(query,tempStorage);
  //     qds.forEach((element) {
  //       tempStorage.add(element);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0F0F0F),
        body: Stack(
          children: [
            Positioned(
                top: Globals.height * 0.05,
                left: 10,
                child: Container(
                  width: Globals.width - 20,
                  height: Globals.getHeight(60),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) async{
                      if (value.length == 0) {
                        setState(() {
                          tempStorage.clear();
                        });
                      }
                      else{
                        setState(() {
                          tempStorage = [];
                          queryResults.forEach((element) {
                            if(element['phone'].toString().contains(value)){
                              tempStorage.add(element);
                            }
                          });
                        });
                      }
                    },
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Globals.getFontSize(20),
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        hintText: 'Search Here',
                        hintStyle: TextStyle(fontSize: 20,color: Colors.white),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: Globals.getWidth(20), vertical: Globals.getHeight(15)),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                )),
            Positioned(
              top: Globals.height * 0.15,
              left: 0.0,
              child: Container(
                height: Globals.height * 0.83,
                width: Globals.width,
                child:
                tempStorage.length!=0?
                ListView(
                  children: List.generate(tempStorage.length, (index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return SearchResultPage(searchResult: tempStorage[index],
                              );
                            },
                            fullscreenDialog: true
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border(
                            //   bottom: BorderSide(
                            //     color: Colors.white,
                            //     width: 1.0
                            //   )
                            // )
                        ),
                        width: Globals.width - 40,
                        padding: EdgeInsets.all(5.0),
                        height: Globals.getHeight(80),
                        child: Stack(
                          children: [
                            Positioned(
                              top: Globals.height * (7 / 812),
                              left: Globals.width * (12 / 375),
                              child: Container(
                                height: Globals.width * (40 / 375),
                                width: Globals.width * (40 / 375),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Globals.getHeight(30)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(tempStorage[index]['dp']))),
                              ),
                            ),
                            Positioned(
                              left: Globals.width * (80 / 375),
                              top: Globals.height * (22 / 812),
                              child: Container(
                                width: Globals.width * (200 / 375),
                                child: AutoSizeText(
                                  tempStorage[index]['name'],
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                  minFontSize: 15.0,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Positioned(
                              right: Globals.width * (10 / 375),
                              top: Globals.height * (12 / 812),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  border: Border.all(color: Colors.white)
                                ),
                                  width: Globals.width * (90 / 375),
                                  child: TextButton(
                                    child: Text(
                                      'Add Friend',
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: Globals.getFontSize(12),
                                          letterSpacing: 1.3,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ):
                Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset('assets/images/no_data.png',height: 250,width: 250,),
                    Text('No Data',style: GoogleFonts.montserrat(fontSize: 30,color: Colors.white),)
                  ],
                ),),
              ),
            )
          ],
        ));
  }
}
