import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker extends StatelessWidget {
  ImagePicker({Key? key}) : super(key: key);
  File? images;

  Future pickImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source);
    if (image == null) return;

    // final selectedImage = File(image.path);

    // setState(() {
    //   images = selectedImage;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () => pickImage(ImageSource.camera),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.camera_alt_outlined),
                              Text('Photo from Camera')
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => pickImage(ImageSource.gallery),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.photo),
                              Text('Photo from Gallery'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ));
      },
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height * .06,
        backgroundColor: Colors.blue,
        child: images != null
            ? ClipOval(
                child: Image.file(
                  images!,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width * .25,
                ),
              )
            : Icon(
                Icons.person_add_alt,
                color: Colors.black,
                size: 60,
              ),
      ),
    );
  }
}
