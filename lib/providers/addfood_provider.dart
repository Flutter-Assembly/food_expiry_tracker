import 'package:flutter/material.dart';

class FoodItem with ChangeNotifier {
  String? _category;
  late String _foodName;
  String? _quantityDescription;
  int _quantityValue = 1;
  String? _description;
  String? _datePurchased;
  String? _dateExpired;
  int? _storageSpace;
  int? _priority;

  // category
  String? get category => _category;

  void setCategory(String category) {
    _category = category;
    notifyListeners();
  }

  // foodName
  String get foodName => _foodName;

  void setfoodName(String foodName) {
    _foodName = foodName;
    notifyListeners();
  }

  // quantityDescription
  String? get quantityDescription => _quantityDescription;

  void setquantityDescription(String quantityDescription) {
    _quantityDescription = quantityDescription;
    notifyListeners();
  }

  // quantityValue
  int? get quantityValue => _quantityValue;

  void incrementquantityValue() {
    _quantityValue++;
    notifyListeners();
  }

  void decrementquantityValue() {
    _quantityValue--;
    notifyListeners();
  }

  // description
  String? get foodDescription => _description;

  void setfoodDescription(String description) {
    _description = description;
    notifyListeners();
  }

  // datePurchased
  String? get datePurchased => _datePurchased;

  void setdatePurchased(String datePurchased) {
    _datePurchased = datePurchased;
    notifyListeners();
  }

  // dateExpired
  String? get dateExpired => _dateExpired;

  void setdateExpired(String dateExpired) {
    _dateExpired = dateExpired;
    notifyListeners();
  }

  // storageSpace
  int? get storageSpace => _storageSpace;

  void setStorageSpace(int storageSpace) {
    _storageSpace = storageSpace;
    notifyListeners();
  }

  // priority
  int? get priority => _priority;

  void setpriority(int priority) {
    _priority = priority;
    notifyListeners();
  }
}
