import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/providers/addfood_provider.dart';
import 'package:food_expiry_tracker/ui/screens/add_food/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddFoodScreen extends StatelessWidget {
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController datePurchasedController = TextEditingController();
  final TextEditingController dateExpiredController = TextEditingController();

  final FocusNode foodNameFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  final FocusNode datePurchasedFocusNode = FocusNode();
  final FocusNode dateExpiredFocusNode = FocusNode();

  void foodNameOnChanged(BuildContext context, String value) =>
      context.read<FoodItem>().setfoodName(value);
  void foodDescriptionOnChanged(BuildContext context, String value) =>
      context.read<FoodItem>().setfoodDescription(value);
  void datePurchasedOnChanged(BuildContext context, String value) =>
      context.read<FoodItem>().setdatePurchased(value);
  void dateExpiredOnChanged(BuildContext context, String value) =>
      context.read<FoodItem>().setdateExpired(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Add new Food',
            style: t7,
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: c3),
          bottom: PreferredSize(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              preferredSize: Size.fromHeight(0))),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading('Category'),
            buildFoodCategories(
                context, '${context.watch<FoodItem>().category}'),
            buildTextFields(
                context: context,
                label: 'Food Name',
                hint: 'Food Name',
                controller: foodNameController,
                focusNode: foodNameFocusNode,
                onchanged: foodNameOnChanged),
            buildFoodQuantities(
                context, '${context.watch<FoodItem>().quantityDescription}'),
            buildFoodQuantityCounter(context),
            buildTextFields(
                context: context,
                label: 'Description',
                hint: 'Description',
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                onchanged: foodDescriptionOnChanged),
            Row(children: [
              Expanded(
                child: buildTextFields(
                    context: context,
                    label: 'Date purchased',
                    hint: 'Date purchased',
                    controller: datePurchasedController,
                    focusNode: datePurchasedFocusNode,
                    onchanged: datePurchasedOnChanged,
                    addHelper: true),
              ),
              SizedBox(width: 40),
              Expanded(
                child: buildTextFields(
                    context: context,
                    label: 'Expiry Date',
                    hint: 'Expiry Date',
                    controller: dateExpiredController,
                    focusNode: dateExpiredFocusNode,
                    onchanged: dateExpiredOnChanged,
                    addHelper: true),
              )
            ]),
            buildSelectStorageLocation(
                context, context.watch<FoodItem>().storageSpace),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: heading('Priority'),
            ),
            buildPriorityButtons(context, context.watch<FoodItem>().priority),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: heading('Photo'),
            ),
            buildImageContainer(context),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(children: [
                Expanded(
                    child: buildAddFoodButton(
                        backgroundColor: c9,
                        textColor: c8,
                        text: 'Cancel',
                        onTap: () => print('Delete'))),
                SizedBox(width: 20),
                Expanded(
                    child: buildAddFoodButton(
                        backgroundColor: c5,
                        textColor: Colors.white,
                        text: 'Save',
                        onTap: () {})),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
