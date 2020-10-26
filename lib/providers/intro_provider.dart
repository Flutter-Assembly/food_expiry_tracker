import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/models/intro_model.dart';

class IntroProvider with ChangeNotifier {
  List<Intro> _introList = [];

  IntroProvider.initialize() {
    _introList = <Intro>[
      Intro(
          title: 'Food Expiry Tracking',
          description: 'Easily track when your food items are expiring to reduce wastage and aid timely consumption',
          image: 'assets/images/slide_image.png'
      ),
      Intro(
          title: 'Track Food Inventory',
          description: 'Restocking of food item now made easy with as you get to manage food item quantity',
          image: 'assets/images/slide_image.png'
      ),
      Intro(
          title: 'Get Instant Reminder',
          description: 'Get notify about your food stuff to know when it get expire or need to restock',
          image: 'assets/images/slide_image.png'
      ),
      Intro(
          title: 'Share with loved ones',
          description: 'Share or invite friends and family to your food storage easily with just a click of a button.',
          image: 'assets/images/slide_image.png'
      )
    ];
    notifyListeners();
  }

  List<Intro> get introList => _introList;
}