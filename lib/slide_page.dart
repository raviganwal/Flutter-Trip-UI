import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_trip/utils/bubble_indication_painter.dart';

class SlidePage extends StatefulWidget {
  SlidePage({Key key}) : super(key: key);

  @override
  _SlidePageState createState() => new _SlidePageState();
}

class _SlidePageState extends State<SlidePage>
    with SingleTickerProviderStateMixin {
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.white;
  Color right = Color(0xFF566EF6);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height*.55,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: _buildMenuBar(context),
            ),
            Expanded(
              flex: 2,
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) {
                  if (i == 0) {
                    setState(() {
                      right = Color(0xFF566EF6);
                      left = Colors.white;
                    });
                  } else if (i == 1) {
                    setState(() {
                      right = Colors.white;
                      left = Color(0xFF566EF6);
                    });
                  }
                },
                children: <Widget>[
                  Center(
                    child: Center(
                      child: new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildOneWay(context),
                      ),
                    ),
                  ),
                  new ConstrainedBox(
                    constraints: const BoxConstraints.expand(),
                    child: _buildRoundTrip(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {}

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 350.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xFFF6F7FB),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onOneWayButtonPress,
                child: Text(
                  "One way",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onRoundTripButtonPress,
                child: Text(
                  "Round Trip",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOneWay(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: 350.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F7FB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Color(0xFF566EF6),
                            size: 22.0,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 250.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextField(
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 14.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: "Type here",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F7FB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: Color(0xFF566EF6),
                            size: 22.0,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 250.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextField(
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 14.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: "Type here",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(child: SizedBox(height: 40)),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F7FB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            FontAwesomeIcons.calendarDay,
                            color: Color(0xFF566EF6),
                            size: 22.0,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 250.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextField(
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 14.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: "Type here",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(child: SizedBox(height: 40)),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Color(0xFF5659F6);
                                else if (states
                                    .contains(MaterialState.disabled))
                                  return Colors.green;
                                return Color(0xFF566EF6); // Use the component's default.
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        child: Text("Search"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundTrip(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: 350.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F7FB),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            FontAwesomeIcons.locationArrow,
                            color: Color(0xFF566EF6),
                            size: 22.0,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 250.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextField(
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 14.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: "Type here",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F7FB),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: Color(0xFF566EF6),
                            size: 22.0,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 250.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextField(
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 14.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: "Type here",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(child: SizedBox(height: 40)),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F7FB),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: Icon(
                            FontAwesomeIcons.calendarDay,
                            color: Color(0xFF566EF6),
                            size: 22.0,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 250.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextField(
                                style: TextStyle(
                                    fontFamily: "WorkSansSemiBold",
                                    fontSize: 14.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  hintText: "Type here",
                                  hintStyle: TextStyle(
                                      fontFamily: "WorkSansSemiBold",
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(child: SizedBox(height: 40)),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Color(0xFF5659F6);
                                else if (states
                                    .contains(MaterialState.disabled))
                                  return Colors.green;
                                return Color(0xFF566EF6); // Use the component's default.
                              },
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ))),
                        child: Text("Search"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onOneWayButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onRoundTripButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
