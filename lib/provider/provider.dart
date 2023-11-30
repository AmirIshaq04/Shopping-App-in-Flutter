import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class MyProvider extends ChangeNotifier {

  final List<Data> card = [
    Data(image: 'asset/images/kheer.jpg', text: 'Price', subtext: '\$10',description:'Speciality',source: 'Source',snext: 'Recipy Keeper',size: 'Serving Size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '10',totalPrice: 0,selecteditem:  '0'),
    Data(image: 'asset/images/baking.jfif', text: 'Price', subtext: '\$7',description:'Healty',source: 'Source',snext: 'Recipy Keeper',size: 'Serving Size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '7',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/bbq.jpg', text: 'Price', subtext: '\$5',description:'BarBeQue',source: 'Source',snext: 'Recipy Keeper',size: 'Serving Size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '5',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/icecream.jfif', text: 'Price', subtext: '\$11',description:'Iced',source: 'Source',snext: 'Recipy Keeper',size: 'Serving size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '11',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/brekfast.jpg', text: 'Price', subtext: '\$8',description:'Morning Snacks',source: 'Source',snext: 'Recipy Keeper',size: 'Serving Size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '8',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/desert.jfif', text: 'Price', subtext: '\$6',description:'Warm',source: 'Source',snext: 'Recipy Keeper',size: 'Serving size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '6',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/lunch.jfif', text: 'Price', subtext: '\$11',description:'Snacks',source: 'Source',snext: 'Recipy Keeper',size: 'Serving Size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '11',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/maindish.jfif', text: 'Price', subtext: '\$7',description:'Favorite Dishes',source: 'Source',snext: 'Recipy Keeper',size: 'Serving size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '7',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/side.jpg', text: 'Price', subtext: '\$9',description:'Sweets',source: 'Source',snext: 'Recipy Keeper',size: 'Serving Size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '9',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/stake.jfif', text: 'Price', subtext: '\$12',description:'Boties',source: 'Source',snext: 'Recipy Keeper',size: 'Serving Size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '12',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/starter.jfif', text: 'Price', subtext: '\$12',description:'refresh Yourself',source: 'Source',snext: 'Recipy Keeper',size: 'Serving size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '12',totalPrice: 0,selecteditem: '0'),
    Data(image: 'asset/images/blank.png', text: 'All', subtext: '\$12',description:'',source: 'Source',snext: 'Recipy Keeper',size: 'Serving size',znext:'8 Percent',price: 10.0,quantity: 0,itemValue: '12',totalPrice: 0,selecteditem: '0')
  ];List<Data> selectedCards = [];
  void updateQuantity(Data card, int newQuentity){
    card.quantity=newQuentity;
    double itemPrice= double.parse(card.itemValue);
    card.totalPrice=itemPrice*newQuentity;
    notifyListeners();
  }

  bool addCard(Data card) {
    if (!card.isSelected) {//if the card has not been selected
      card.isSelected = true;// card is added
      selectedCards.add(card);//card added in selected card
      notifyListeners();
      return true;
    } else {
      return false;// if card has not been added
    }
  }
  bool isCardSelected(Data cardtocheck){
    return selectedCards.contains(cardtocheck);
  }


  void removeCard(Data card) {
    card.isSelected=false;//we place it to ensure that the card is not selected that is going to be deleted
    selectedCards.remove(card);
    notifyListeners();
  }
}



