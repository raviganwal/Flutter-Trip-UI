import 'package:flutter/material.dart';
import 'package:sample_trip/slide_page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class BottomSheetScreen extends StatefulWidget {
  @override
  _BottomSheetScreenState createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
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