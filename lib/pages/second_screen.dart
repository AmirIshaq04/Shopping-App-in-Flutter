import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController _quantityController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    double subTotal = provider.selectedCards.fold(
        0, (previousValue, element) => previousValue + element.totalPrice);
    return Scaffold(
      body: Center(
        child: provider.selectedCards.isNotEmpty
            ? ListView.builder(
                itemCount: provider.selectedCards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image.asset(
                                  provider.selectedCards[index].image,
                                  width: 300.w,
                                  fit: BoxFit.fill,
                                  height: 150, // Set the image height
                                ),
                              ),
                              Positioned(
                                top: 125.0,
                                left: 20.0,
                                child: Text(
                                  provider.selectedCards[index].description,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 20.w),
                              Text(
                                provider.selectedCards[index].source,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 55.w),
                              Text(
                                provider.selectedCards[index].snext,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 20.w),
                              Text(
                                provider.selectedCards[index].size,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                provider.selectedCards[index].znext,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(width: 90.w),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Delete Card'),
                                        content: const Text(
                                          'Are you sure you want to delete this card?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              provider.removeCard(provider.selectedCards[index]); // Use Provider to remove cards
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Price per Item : \$${provider.selectedCards[index].itemValue.toString()}',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                   Padding(
                                     padding:  EdgeInsets.only(left: 10.0),
                                     child: Text('Selected Items \:${provider.selectedCards[index].quantity}',style: TextStyle(color: Colors.black54),),
                                   ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Gross Value\$${provider.selectedCards[index].totalPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            title:
                                                const Text('Select Quantity'),
                                            children:[
                                          ListTile(title: Text('Add desired Items below',style: TextStyle(color: Colors.red),),
                                          subtitle: Column(
                                          children: [TextField(
                                          controller: _quantityController,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                          hintText: 'Enter Quantity',),),],),
                                          trailing: TextButton(
                                          onPressed: () {
                                          int? customQuantity = int.tryParse(_quantityController.text);
                                          if (customQuantity != null && customQuantity > 0) {
                                          provider.updateQuantity(provider.selectedCards[index], customQuantity,);
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(backgroundColor:
                                          Colors.grey, dismissDirection: DismissDirection.vertical,
                                          shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                          elevation: 8.0,
                                          content: Text('You have selected $customQuantity Items'),
                                          duration: const Duration(seconds: 2),),);}
                                          else {ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                          content: Text('You have entered an invalid value'),
                                          duration: Duration(
                                          seconds: 2),),);}},
                                          child:  Text('Add',style: TextStyle(color: Colors.red,fontSize: 15.sp),)),),]+
                                            List.generate(10, (quantityIndex) {final quantity = quantityIndex + 1;
                                                  return ListTile(
                                                    title: Text('$quantity'),
                                                    onTap: () {
                                                      provider.updateQuantity(provider.selectedCards[index], quantity,);
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text('You have selected $quantity Items'),
                                                          duration: const Duration(seconds: 2),
                                                        ),
                                                      );
                                                    },

                                                  );
                                            }
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const Text(
                                      'Edit Item Quantity',
                                      style: TextStyle(color: Colors.red),
                                    )),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              )
            :  Center(child: Stack(
              children: [
                Image.asset('asset/images/panda.jpg',fit: BoxFit.cover,),
                Positioned(
                    top: 170.0,
                    left: 70.0,
                    child: Text('You have added Nothing ',style: TextStyle(fontSize: 20.sp,color: Colors.black54),)),
              ],
            )
        ),
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        color: Colors.grey,
        child: Align(
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Subtotal : \$${subTotal.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.black54, fontSize: 15.sp),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Confirm Your order',
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
            )),
      )
    );
  }
}
