import 'package:flutter/material.dart';
import 'package:sample_trip/slide_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        backdropEnabled: false,
        defaultPanelState: PanelState.OPEN,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        panel: Center(
          child: SlidePage(),
        ),
        body: Scaffold(
          body:  Container(
            color: Colors.brown.shade50,
            child: Center(
              child: Text("add your MAP here"),
            ),
          ),
        ),
      ),
    );
  }
}