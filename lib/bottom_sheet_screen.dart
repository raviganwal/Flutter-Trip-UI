import 'package:flutter/material.dart';
import 'package:sample_trip/slide_page.dart';

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
  Widget build(BuildContext co0ntext) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.brown.shade50,
            child: Image.network(
              "https://www.dsdinc.com/wp-content/uploads/2017/08/map-placeholder.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(color: Colors.grey.shade50, child: SlidePage())),
        ],
      ),
    );
  }
}
