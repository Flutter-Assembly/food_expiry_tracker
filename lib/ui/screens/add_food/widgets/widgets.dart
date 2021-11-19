import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:food_expiry_tracker/providers/addfood_provider.dart';
import 'package:provider/provider.dart';

TextStyle t1 = TextStyle(fontSize: 13, color: c5, fontWeight: FontWeight.w500);
TextStyle t2 = TextStyle(fontSize: 15, color: c4, fontWeight: FontWeight.w600);
TextStyle t3 = TextStyle(fontSize: 15, color: c6);
TextStyle t4 = TextStyle(fontSize: 14, color: c6);
TextStyle t5 = TextStyle(fontSize: 14, color: c3);
TextStyle t6 = TextStyle(fontSize: 14, color: c8);
TextStyle t7 = TextStyle(fontSize: 16, color: c3);

Color c1 = Color(0xffD7D7D7).withOpacity(0.4);
Color c2 = Color(0xffFFC100);
Color c3 = Color(0xff454545);
Color c4 = Color(0xff454545).withOpacity(0.55);
Color c5 = Color(0xff012072);
Color c6 = Color(0xff454545).withOpacity(0.50);
Color c7 = Color(0xff707070).withOpacity(0.5);
Color c8 = Color(0xff151515);
Color c9 = Color(0xffD7D7D7);

Widget heading(String heading) {
  return Text(heading, style: t2);
}

Widget buildFoodCategories(BuildContext context, String selectedCategory) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildFoodCategory(context, 'Grocery', 'assets/images/Grocery_2.svg',
            'assets/images/Grocery_1.svg', selectedCategory == 'Grocery'),
        buildFoodCategory(
            context,
            'Provisions',
            'assets/images/provision_2.svg',
            'assets/images/provision_1.svg',
            selectedCategory == 'Provisions'),
        buildFoodCategory(context, 'Fruits', 'assets/images/fruits_2.svg',
            'assets/images/fruits_1.svg', selectedCategory == 'Fruits'),
        buildFoodCategory(context, 'Fast Food', 'assets/images/fast_food_2.svg',
            'assets/images/fast_food_1.svg', selectedCategory == 'Fast Food'),
      ],
    ),
  );
}

Widget buildFoodCategory(BuildContext context, String categoryId,
    String selectedImgPath, String unSelectedImgPath, bool isSelected) {
  Size size = MediaQuery.of(context).size;
  return InkWell(
    onTap: () => context.read<FoodItem>().setCategory(categoryId),
    child: Column(
      children: [
        SvgPicture.asset(
          isSelected ? selectedImgPath : unSelectedImgPath,
          height: size.width / 5,
          width: size.width / 5,
        ),
        SizedBox(height: 10),
        Text(
          categoryId,
          style: t3,
        )
      ],
    ),
  );
}

Widget buildTextFields(
    {BuildContext? context,
    String? label,
    String? hint,
    TextEditingController? controller,
    FocusNode? focusNode,
    Function? onchanged,
    bool addHelper = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      style: t5,
      cursorColor: c5,
      decoration: InputDecoration(
        labelText: focusNode!.hasFocus ? label : null,
        labelStyle: t1,
        hintText: hint,
        hintStyle: t4,
        helperText: addHelper && focusNode.hasFocus ? 'mm/dd/yyyy' : null,
        helperStyle: t1,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: c5),
        ),
      ),
      onChanged: (value) => onchanged!(context, value),
    ),
  );
}

Widget buildFoodQuantities(BuildContext context, String selectedQuantity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildFoodQuantity(context, 'gram', 'gram' == selectedQuantity),
      buildFoodQuantity(context, 'pack', 'pack' == selectedQuantity),
      buildFoodQuantity(context, 'box', 'box' == selectedQuantity),
      buildFoodQuantity(context, 'bag', 'bag' == selectedQuantity),
      buildFoodQuantity(context, 'unit', 'unit' == selectedQuantity),
    ],
  );
}

Widget buildFoodQuantity(
    BuildContext context, String quantityId, bool isSelected) {
  return Expanded(
    child: InkWell(
      onTap: () => context.read<FoodItem>().setquantityDescription(quantityId),
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: isSelected ? BoxDecoration(color: c2) : BoxDecoration(),
        child: Center(
            child: Text(quantityId,
                style: TextStyle(
                    fontSize: 14, color: isSelected ? Colors.white : c4))),
      ),
    ),
  );
}

Widget buildFoodQuantityCounter(BuildContext context) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.solid, color: c7, width: 1)),
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        style: BorderStyle.solid, color: c7, width: 1))),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    if (context.read<FoodItem>().quantityValue! > 1)
                      context.read<FoodItem>().decrementquantityValue();
                  },
                  icon: Icon(Icons.remove, color: c6)),
            ),
          ),
        ),
        Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          style: BorderStyle.solid, color: c7, width: 1))),
              child: Center(
                child: Text(
                    '${context.watch<FoodItem>().quantityValue} ${shortenedQuantityDescription(context)}'),
              ),
            )),
        Flexible(
          flex: 1,
          child: Container(
            child: Center(
              child: IconButton(
                  onPressed: () =>
                      context.read<FoodItem>().incrementquantityValue(),
                  icon: Icon(Icons.add, color: c6)),
            ),
          ),
        )
      ],
    ),
  );
}

String shortenedQuantityDescription(BuildContext context) {
  String? word = context.watch<FoodItem>().quantityDescription;
  String short;
  switch (word) {
    case 'gram':
      short = 'gm';
      break;

    case 'pack':
      short = 'pk';
      break;

    case 'box':
      short = 'bx';
      break;

    case 'bag':
      short = 'bg';
      break;

    case 'unit':
      short = 'un';
      break;

    default:
      short = '';
      break;
  }

  return short;
}

Widget buildSelectStorageLocation(BuildContext context, int? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: DropdownButton(
      isExpanded: true,
      hint: Text('Storage space to use', style: t4),
      value: value,
      items: [
        DropdownMenuItem(
          child: ListTile(
            leading: SvgPicture.asset('assets/images/fridge.svg'),
            title: Text('Fridge', style: t6),
          ),
          value: 1,
        ),
        DropdownMenuItem(
          child: ListTile(
            leading: SvgPicture.asset('assets/images/fridge.svg'),
            title: Text('Freezer', style: t6),
          ),
          value: 2,
        ),
        DropdownMenuItem(
            child: ListTile(
              leading: SvgPicture.asset('assets/images/storage_room.svg'),
              title: Text('Storage Room', style: t6),
            ),
            value: 3),
        DropdownMenuItem(
            child: ListTile(
              leading: SvgPicture.asset('assets/images/pantry.svg'),
              title: Text('Pantry', style: t6),
            ),
            value: 4),
        DropdownMenuItem(
            child: ListTile(
              leading: SvgPicture.asset('assets/images/medicine_cabinet.svg'),
              title: Text('Medicine cabinet', style: t6),
            ),
            value: 5)
      ],
      onChanged: (value) =>
          context.read<FoodItem>().setStorageSpace(int.parse(value.toString())),
    ),
  );
}

Widget buildPriorityButtons(BuildContext context, int? radioValue) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Radio(
        value: 0,
        groupValue: radioValue,
        onChanged: (value) =>
            context.read<FoodItem>().setpriority(int.parse(value.toString())),
        activeColor: c2,
      ),
      Text('Low Priority', style: t4),
      Spacer(),
      Radio(
        activeColor: c2,
        value: 1,
        groupValue: radioValue,
        onChanged: (value) =>
            context.read<FoodItem>().setpriority(int.parse(value.toString())),
      ),
      Text('High Priority', style: t4),
      SizedBox(width: 30)
    ],
  );
}

buildImageContainer(BuildContext context, {String? image}) {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 20),
    height: 90,
    width: 90,
    child: DottedBorder(
        color: c6,
        borderType: BorderType.RRect,
        padding: EdgeInsets.all(6),
        child: image != null
            ? Image.file(File(image))
            : Center(
                child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: c6,
                ),
                onPressed: () => addPhotoDialog(context),
              ))),
  );
}

addPhotoDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Wrap(children: [
            ListTile(
              leading: SvgPicture.asset('assets/images/from_camera.svg'),
              title: Text(
                'Take photo',
                style: t6,
              ),
            ),
            ListTile(
                leading: SvgPicture.asset('assets/images/add_from_gallery.svg'),
                title: Text(
                  'Choose image from gallery',
                  style: t6,
                ))
          ]),
        );
      });
}

buildAddFoodButton(
    {Color? textColor, Color? backgroundColor, String? text, Function? onTap}) {
  return Container(
    height: 45,
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: Text(
        text!,
        style: TextStyle(color: textColor, fontSize: 15),
      ),
    ),
  );
}
