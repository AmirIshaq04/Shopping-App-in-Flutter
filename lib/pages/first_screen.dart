import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/second_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../provider/provider.dart';

enum MenuItem { item1, item2, item3,}
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);


  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  TextEditingController _quantityController = TextEditingController();


// File? _image;
// final picker= ImagePicker();
//  Future getImage()async{
//    final pickedImage= await picker.pickImage(source: ImageSource.gallery);
//    if(pickedImage!=null){
//      _image=File(pickedImage.path);
//    }
//    else{
//      showDialog(context: context, builder: (BuildContext context){
//        return AlertDialog(
//          content: Text('No image found'),
//        );
//      });
//    }
//  }

  File? _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      } else {
       print('No file exists');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // bool isImageSelected = false;
  // late PickedFile pickedImage;
  // _pickImagefromGallery() async {
  //   try {
  //     final image =
  //     await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       setState(() {
  //         pickedImage =image;
  //         isImageSelected = true;
  //       });
  //     } else {
  //       print('User didnt pick any image.');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // _pickImagefromCamera() async {
  //   try {
  //     final pickedImage =
  //     await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (pickedImage != null) {
  //       setState(() {
  //         imageFile = File(pickedImage.path);
  //         isImageSelected = true;
  //       });
  //     } else {
  //       print('User didnt pick any image.');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  @override
  void dispose(){
    _quantityController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {



      final provider = Provider.of<MyProvider>(context, listen: false);

    double subTotal = provider.selectedCards.fold(
        0, (previousValue, element) => previousValue + element.totalPrice);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Text('View Cart',style: TextStyle(color: Colors.white,fontSize: 20.sp),),
          IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen()));
          }, icon: Icon(Icons.shopping_cart_checkout,color: Colors.white,)),
        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.grey,
          child: ListView(
            children: [
              DrawerHeader(
                curve: Curves.linear,
                child: Text('Our Delicious food Carte',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20.sp,
                      fontFamily: 'sans_regular'),
                ),
              ),
              InkWell(
                onTap: null,
                child: ListTile(
                  title: const Text('Our Specialities',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {},
                ),
              ),
              ListTile(
                title: const Text('Sea Foods',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Summer Snacks',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Seasonal Dishes',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Desi Foods',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Go to Your Gallery',
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () async{
                    await getImage();
                  }

              ),
            ],
          )),
      body: SafeArea(
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: provider.card.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final isSelected = provider.selectedCards.contains(provider.card[index]);
            return GestureDetector(
              child: Stack(
                  children:[ Card(
                    shadowColor: Colors.cyan,
                    elevation: 15,
                    margin: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(provider.card[index].image, fit: BoxFit.fill),
                        ),
                        Container(
                          color: Colors.orange,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  provider.card[index].text,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Text(
                                provider.card[index].subtext,
                                style: const TextStyle(color: Colors.white),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                    Positioned(
                      left: 80.0,
                      top: 7.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 17.0,
                        child:PopupMenuButton(color: Colors.grey,
                            onSelected: (value){
                              if(value==MenuItem.item1){

                              }else if(value==MenuItem.item2){

                              }else if(value==MenuItem.item3){

                              }
                            },
                            itemBuilder: (context)=>[
                              PopupMenuItem(
                                  child: const Text('Add your Items here',style: TextStyle(color: Colors.black54),),
                                  onTap: () {
                                    WidgetsBinding?.instance?.addPostFrameCallback((_) {
                                      showCupertinoDialog(
                                          context: context,
                                          builder: (context) {
                                            int selectedCardIndex = index; // Store the index of the selected card
                                            provider.addCard(provider.card[selectedCardIndex]); // Add the selected card
                                            return   SimpleDialog(backgroundColor: Colors.white,
                                              title:
                                              const Text('Select Quantity'),
                                              children:[
                                               Image.asset(provider.card[index].image),
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
                                                          provider.updateQuantity(provider.card[selectedCardIndex], customQuantity,);
                                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen()));
                                                          Navigator.pop(context);
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(backgroundColor:
                                                            Colors.grey, dismissDirection: DismissDirection.vertical,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(8)),
                                                              elevation: 8.0,
                                                              content: Text('You have selected $customQuantity Items'),
                                                              duration: const Duration(seconds: 2),),);
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
                                                        }

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
                                                      provider.updateQuantity(provider.card[selectedCardIndex], quantity,);
                                                      Navigator.pop(context);
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text('You have selected $quantity Items'),
                                                        duration: const Duration(seconds: 2),
                                                      ),
                                                      );
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen()));
                                                    },
                                                  );
                                                  }
                                                  ),
                                            );
                                          }
                                          );
                                    }
                                    );
                                  }),
                            ]//itembuilder
                        ),//PopupMenuButton Ends here
                      ),//CircleAvatar
                    )//Positioned

                  ]//Childern of stack
              ),//stack

            );//Gesture Detector
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.5,
            mainAxisSpacing: 1,
            crossAxisSpacing: 0,
          ),
        ),
      ),
    );
  }
}
