import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/screens/food_details/widgets/ExpirationWidget.dart';
import 'package:food_expiry_tracker/ui/screens/food_details/widgets/foodDetailsRichText.dart';

class FoodDetailsScreen extends StatefulWidget {
  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28.0,
          ),
          color: Color(0XFF454545),
          onPressed: () => ExtendedNavigator.of(context).pop(),
        ),
        title: Text(
          'Spaghetti',
          style: kBodyText2,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              size: 30.0,
            ),
            color: Color(0XFF454545),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: 220,
                    width: deviceWidth,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 7.0,
                      shadowColor: Color(0XFF5F00ED).withOpacity(.7),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/food.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: IconButton(
                      icon: SvgPicture.asset('assets/images/edit.svg'),
                      color: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      tooltip: 'Edit',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              ExpirationWidget(),
              SizedBox(height: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FoodDetailsRichText(
                    title: 'Category',
                    subTitle: 'Fast Food',
                  ),
                  FoodDetailsRichText(
                    title: 'Storage',
                    subTitle: 'Fridge',
                  ),
                  FoodDetailsRichText(
                    title: 'Quantity',
                    subTitle: '1 Pack',
                  ),
                ],
              ),
              Divider(thickness: 1.0),
              FoodDetailsRichText(
                title: 'Description',
                subTitle: 'Extra rice mixed with chicken',
              ),
              Divider(thickness: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FoodDetailsRichText(
                    title: 'Priority',
                    subTitle: 'High Priority',
                  ),
                  SvgPicture.asset('assets/fire.svg')
                ],
              ),
              Divider(thickness: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FoodDetailsRichText(
                    title: 'Date Purchased',
                    subTitle: '25/10/2020',
                  ),
                  FoodDetailsRichText(
                    title: 'Expiry Date',
                    subTitle: '02/11/2020',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6.0,
                  ),
                  child: RaisedButton(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: Text(
                        'Edit Details',
                        style: kBodyText6,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
