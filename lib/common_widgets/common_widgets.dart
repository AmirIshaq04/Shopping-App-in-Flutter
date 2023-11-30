// Future<List<AssetEntity>> loadImagesFromGallery() async {
//   List<AssetEntity> images = [];
//   var result = await PhotoManager.requestPermission();
//   if (result) {
//     List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(onlyAll: true);
//     images = await albums[0].getAssetListRange(start: 0, end: 10000);
//   }
//   return images;
// }
//
// class GalleryScreen extends StatefulWidget {
//   @override
//   _GalleryScreenState createState() => _GalleryScreenState();
// }
//
// class _GalleryScreenState extends State<GalleryScreen> {
//   List<AssetEntity>? _images;
//
//   @override
//   void initState() {
//     super.initState();
//     loadImagesFromGallery().then((value) {
//       setState(() {
//         _images = value;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gallery'),
//       ),
//       body: _images != null
//           ? GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 4.0,
//           mainAxisSpacing: 4.0,
//         ),
//         itemCount: _images!.length,
//         itemBuilder: (BuildContext context, int index) {
//           return FutureBuilder<Uint8List?>(
//             future: _images![index].thumbDataWithSize(200, 200),
//             builder: (BuildContext context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done &&
//                   snapshot.hasData) {
//                 return Image.memory(snapshot.data!);
//               } else {
//                 return Container(); // Placeholder or loading indicator
//               }
//             },
//           );
//         },
//       )
//           : Center(
//         child: CircularProgressIndicator(), // Loading indicator
//       ),
//     );
//   }
// }

// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
// <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
