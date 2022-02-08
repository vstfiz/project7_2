import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/arrow_clipper/arrow_clipper.dart';

import '../globals.dart';

class CustomDropDown extends StatefulWidget {
  final double width;
  final double height;
  final int itemsCount;
  final List<String> items;
  final double radius;

  CustomDropDown(
      {this.width, this.height, this.itemsCount, this.items, this.radius});

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String value = "Select";
  OverlayEntry _overlayEntry;
  LayerLink link = LayerLink();
  bool isOverlayRendered = false;

  @override
  initState() {
    super.initState();
  }

  _toggleOverlay() {
    if (!isOverlayRendered) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry);
    } else {
      _overlayEntry.remove();
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    print(offset.dy);
    return OverlayEntry(
      builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 10.0,
          bottom: Globals.height - (offset.dy + size.height + 10.0 + Globals.getHeight(376)),
          width: widget.width,
          child: Material(
            type: MaterialType.transparency,
            child: CompositedTransformFollower(
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + 10.0),
              child: ClipPath(
                clipper: ArrowClipper(widget.radius),
                child: Container(
                  width: widget.width,
                  height: Globals.getHeight(360) + 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),            color: Color(0xFF231F20),

                  ),
                  padding: EdgeInsets.only(top: 15),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: List.generate(widget.items.length, (index) {
                      return (widget.items.length-1==index)?Container(
                        width: widget.width,
                        height: Globals.getHeight(60),
                        decoration: BoxDecoration(
                            color: Color(0xFF231F20),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(widget.radius),
                              bottomRight: Radius.circular(widget.radius),
                            )),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              value = widget.items[index];
                              isOverlayRendered = false;
                            });
                            _overlayEntry.remove();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Container(
                                  width: widget.width * 0.75,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Text(
                                    widget.items[index],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(15),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                left: 0.0,
                              ),
                              Positioned(
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 0.599)),
                                    child: widget.items[index] == value
                                        ? Center(
                                      child: CircleAvatar(
                                        radius: 7,
                                        foregroundColor: Color(0xFF7585FF),
                                      ),
                                    )
                                        : SizedBox()),
                                right: 20,
                              )
                            ],
                          ),
                        ),
                      ):Container(
                        width: widget.width,
                        height: Globals.getHeight(60),
                        decoration: BoxDecoration(
                          color: Color(0xFF231F20),
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.white,
                                  width: 0.5)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              value = widget.items[index];
                              isOverlayRendered = false;
                            });
                            _overlayEntry.remove();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Container(
                                  width: widget.width * 0.75,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: Text(
                                    widget.items[index],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: Globals.getFontSize(15),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                left: 0.0,
                              ),
                              Positioned(
                                child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 0.599)),
                                    child: widget.items[index] == value
                                        ? Center(
                                      child: CircleAvatar(
                                        radius: 7,
                                        foregroundColor: Color(0xFF7585FF),
                                      ),
                                    )
                                        : SizedBox()),
                                right: 20,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              link: link,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: link,
      child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: GestureDetector(
            onTap: () {
              _toggleOverlay();
              setState(() {
                isOverlayRendered = !isOverlayRendered;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: widget.width * 0.75,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    value,
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: Globals.getFontSize(15),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 24,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
