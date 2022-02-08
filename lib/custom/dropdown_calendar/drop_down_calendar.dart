import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project7_2/custom/arrow_clipper/arrow_clipper.dart';
import 'package:project7_2/custom/calendar/calendar.dart'
    show CalendarCarousel, EventList;
import 'package:project7_2/custom/calendar/event.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../globals.dart';

class DropDownCalendar extends StatefulWidget {
  final double width;
  final double height;
  final double dropdownHeight;
  final double dropdownWidth;
  final double radius;

  DropDownCalendar(
      {this.width,
      this.height,
      this.dropdownHeight,
      this.dropdownWidth,
      this.radius});

  @override
  _DropDownCalendarState createState() => _DropDownCalendarState();
}

class _DropDownCalendarState extends State<DropDownCalendar> {
  DateTime _currentDate = DateTime.now();
  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.white, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
    },
  );
  String value;

  @override
  void initState() {
    value = _currentDate.day.toString()+"/"+_currentDate.month.toString()+"/"+_currentDate.year.toString();
    super.initState();
  }

  OverlayEntry _overlayEntry;
  LayerLink link = LayerLink();
  bool isOverlayRendered = false;

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
    return OverlayEntry(
      builder: (context) => Positioned(
          left: offset.dx,
          top: offset.dy + size.height + 10.0,
          width: widget.width,
          child: Material(
            type: MaterialType.transparency,
            child: CompositedTransformFollower(
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + 10.0),
              child: ClipPath(
                clipper: ArrowClipper(widget.radius),
                child: Container(
                  width: widget.dropdownWidth,
                  height: widget.dropdownHeight + 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    color: Color(0xFF231F20),
                  ),
                  child: CalendarCarousel<Event>(
                      onDayPressed: (DateTime date, List<Event> events) {
                        this.setState(() => _currentDate = date);
                      },
                      weekendTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      thisMonthDayBorderColor: Colors.grey,
                    minSelectedDate: new DateTime(_currentDate.year,_currentDate.month,_currentDate.day
                    ),
                      weekFormat: false,
                      markedDatesMap: _markedDateMap,
                      height: 420.0,
                      selectedDateTime: _currentDate,
                      daysHaveCircularBorder: true,
                    onDayLongPressed: (date){
                        setState(() {
                          value = date.day.toString()+"/"+date.month.toString()+"/"+date.year.toString();
                        });
                        _toggleOverlay();
                        setState(() {
                          isOverlayRendered = false;
                        });

                    },
                    ),
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
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

//
// Container(
// margin: EdgeInsets.all(widget.dayPadding),
// padding: EdgeInsets.all(widget.dayPadding),
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// border: Border.all(
// color: Colors.white,
// )
// ),
// child: TextButton(
// onPressed: () => _onDayLongPressed(now),
// // onPressed: widget.disableDayPressed ? null : () => _onDayPressed(now),
// child: Stack(
// children: widget.showIconBehindDayText
// ? <Widget>[
// widget.markedDatesMap != null
// ? _renderMarkedMapContainer(now)
// : Container(),
// getDayContainer(
// isSelectable,
// index,
// isSelectedDay,
// isToday,
// isPrevMonthDay,
// textStyle,
// defaultTextStyle,
// isNextMonthDay,
// isThisMonthDay,
// now),
// ]
// : <Widget>[
// getDayContainer(
// isSelectable,
// index,
// isSelectedDay,
// isToday,
// isPrevMonthDay,
// textStyle,
// defaultTextStyle,
// isNextMonthDay,
// isThisMonthDay,
// now),
// widget.markedDatesMap != null
// ? _renderMarkedMapContainer(now)
// : Container(),
// ],
// ),
// ),
// );