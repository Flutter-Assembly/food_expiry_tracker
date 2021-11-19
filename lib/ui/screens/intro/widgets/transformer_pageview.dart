import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/helpers/size_config.dart';
import 'package:food_expiry_tracker/providers/intro_provider.dart';
import 'package:provider/provider.dart';

class TransformPageView extends StatefulWidget {
  final Function(int)? onPageChanged;
  final slideIndex;
  TransformPageView({this.onPageChanged, this.slideIndex});
  @override
  _TransformPageViewState createState() => _TransformPageViewState();
}

class _TransformPageViewState extends State<TransformPageView> {
  @override
  Widget build(BuildContext context) {
    final intro = Provider.of<IntroProvider>(context);

    return PageView.builder(
        itemCount: intro.introList.length,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: SizeConfig.blockSizeVertical * 4),
                Column(
                  children: <Widget>[
                    Image(
                      image:
                          AssetImage(intro.introList[widget.slideIndex].image!),
                      height: SizeConfig.blockSizeVertical * 35.0,
                      width: SizeConfig.blockSizeHorizontal * 90.0,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
    // return TransformerPageView(
    //   pageSnapping: true,
    //   onPageChanged: widget.onPageChanged,
    //   loop: false,
    //   controller: controller,
    //   transformer: PageTransformerBuilder(
    //     builder: (Widget child, TransformInfo info) {
    //       return Container(
    //         alignment: Alignment.center,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             SizedBox(height: SizeConfig.blockSizeVertical * 4),
    //             Column(
    //               children: <Widget>[
    //                 Image(
    //                   image:
    //                       AssetImage(intro.introList[widget.slideIndex].image!),
    //                   height: SizeConfig.blockSizeVertical * 35.0,
    //                   width: SizeConfig.blockSizeHorizontal * 90.0,
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    //   itemCount: intro.introList.length,
    // );
  }
}
