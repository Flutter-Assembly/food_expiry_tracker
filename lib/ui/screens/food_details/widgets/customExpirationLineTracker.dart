import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomExpirationLineTracker extends StatefulWidget {
  final double expirationPercent;

  CustomExpirationLineTracker({required this.expirationPercent});

  @override
  _CustomProgressCardState createState() => _CustomProgressCardState();
}

class _CustomProgressCardState extends State<CustomExpirationLineTracker> {
  GlobalKey _containerGlobalKey = GlobalKey();
  double? _containerWidth;

  @override
  void initState() {
    super.initState();
    //To get the width of progress container.
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        _containerWidth = _containerGlobalKey.currentContext!.size!.width;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      child: Stack(
        children: [
          Container(
            key: _containerGlobalKey,
            decoration: BoxDecoration(
                color: Color(0XFFE9E9E9),
                borderRadius: BorderRadius.circular(12.0)),
          ),
          FractionallySizedBox(
            widthFactor: widget.expirationPercent / 100,
            child: Container(
              decoration: BoxDecoration(
                  color: widget.expirationPercent > 50.0
                      ? Color(0xFF00C40A)
                      : Color(0XFFF90B0B),
                  borderRadius: BorderRadius.circular(12.0)),
            ),
          )
        ],
      ),
    );
  }
}
