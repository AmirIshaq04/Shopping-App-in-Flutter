class Data {
  String image;
  String text;
  String subtext;
  String description;
  String source;
  String snext;
  String size;
  String znext;
  int quantity;
  double price;
  String itemValue;
  double totalPrice;
  bool isSelected;
  String selecteditem;

  Data({
    required this.image,
    required this.text,
    required this.subtext,
    required this.description,
    required this.source,
    required this.snext,
    required this.size,
    required this.znext,
    required this.itemValue,
    this.quantity=1,
    this.price=10,
    required this.totalPrice,
    this.isSelected=false,
    required this.selecteditem,





  });
  double getTotalPrice() {
    return price * quantity;
  }

}

