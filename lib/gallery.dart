import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class Gallery extends StatefulWidget {
  final List<Image> gallery;

  Gallery(this.gallery);

  GalleryState createState() => GalleryState(gallery);
}
class GalleryState extends State<Gallery>{
  final List<Image> gallery;

  GalleryState(this.gallery);

  void uploadGalleryImage() async{
    final picker = ImagePicker();
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    File imageFile = File(pickedImage.path);
    String base64Image = base64Encode(imageFile.readAsBytesSync());
    print(base64Image);
    setState(() {
        gallery.add(Image.file(File(pickedImage.path)));
    });
  }

  void deleteImage(int index){
    setState(() {
      gallery.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Vehicle Gallery'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: uploadGalleryImage,
        child:Icon(Icons.insert_photo),
      ),
      body: gallery.length > 0 ?
      ListView.builder(
          itemCount: gallery.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    border: Border.all(width:3.0,color: Colors.blue,),
                  ),
                  child: gallery[index],
                ),
                RaisedButton(
                  onPressed: () => deleteImage(index),
                  color: Colors.blue,
                  child: Icon(Icons.delete,color: Colors.white,),
                )
              ],
            );
          }
          ):
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: EdgeInsets.all(25),
        child: Text('No Images Yet!'),
      ),
    );
  }
}