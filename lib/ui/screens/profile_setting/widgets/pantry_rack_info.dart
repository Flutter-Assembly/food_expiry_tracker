import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/utilities/app_constants.dart';

/*To hold information of the PantryRack, like how many items are in the
*Refrigerator, Pantry, Medicine Cabinet, etc*/

class PantryRackInfo extends StatelessWidget {
  final int infoAmount;
  final bool hasAmount;
  final String infoTitle;
  final String infoIconName;
  final bool hasBottomDivider;

  PantryRackInfo({
    this.hasAmount = true,
    required this.infoTitle,
    required this.infoAmount,
    required this.infoIconName,
    this.hasBottomDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('$imagesPath/$infoIconName.png'),
              SizedBox(width: 12),
              Text(
                infoTitle,
                style: kHeadingText2Medium.copyWith(
                  fontSize: 15,
                  color: kPrimaryTextColor,
                ),
              ),
              Spacer(),
              hasAmount
                  ? Container(
                      width: 20,
                      decoration: BoxDecoration(
                          color: kPrimaryYellow,
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '$infoAmount',
                        textAlign: TextAlign.center,
                        style: kBodyText4.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 14,
                icon: Icon(Icons.arrow_forward_ios_outlined),
                onPressed: () {},
              )
            ],
          ),
          hasBottomDivider
              ? Divider(
                  color: kSecondaryBorder,
                  thickness: 2,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
