import 'dart:ui';

import 'package:flutter/material.dart';

class UploadProfile extends StatelessWidget {
  const UploadProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height * .06,
      backgroundColor: Colors.blue,
      backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1511367461989-f85a21fda167?.jpg'),
    );
  }

// Widget ProfileImage() =>
//     CircleAvatar(
//       backgroundColor: Colors.blue,
//       backgroundImage:NetworkImage('https://images.unsplash.com/photo-1511367461989-f85a21fda167?.jpg'),
//     );
}
