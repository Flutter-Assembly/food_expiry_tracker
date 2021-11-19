class Food {
  static const tblFood = 'foods';
  static const colId = 'id';
  static const colFoodName = 'food_name';
  static const colPurchaseDate = 'purchase_date';
  static const colExpiredDate = 'expired_date';
  static const colPriority = 'priority';
  static const colSpaceId = 'space_id';
  static const colCategoryId = 'category_id';

  Food(
      {this.id,
      this.foodName,
      this.purchaseDate,
      this.expiredDate,
      this.priority,
      this.spaceId,
      this.categoryId});

  Food.fromMap(Map<String, dynamic> json) {
    foodName = json[colFoodName];
    purchaseDate = json[colPurchaseDate];
    expiredDate = json[colExpiredDate];
    priority = json[colPriority];
    spaceId = json[colSpaceId];
    categoryId = json[colCategoryId];
  }

  int? id;
  String? foodName;
  String? purchaseDate;
  String? expiredDate;
  int? priority;
  int? spaceId;
  int? categoryId;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[colId] = this.id;
    data[colFoodName] = this.foodName;
    data[colPurchaseDate] = this.purchaseDate;
    data[colExpiredDate] = this.expiredDate;
    data[colPriority] = this.priority;
    data[colSpaceId] = this.spaceId;
    data[colCategoryId] = this.categoryId;
    return data;
  }
}
