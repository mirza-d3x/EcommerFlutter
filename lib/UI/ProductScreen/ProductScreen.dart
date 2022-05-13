import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: mHeight * .4,
            width: mWidth * .2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://images.indianexpress.com/2015/03/sony-a6000-review.jpg',
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'SonyAlpha ILCE-7RM4 ALPHA',
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '₹25000',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(
              top: 5,
            ),
            height: mHeight * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https://images.indianexpress.com/2015/03/sony-a6000-review.jpg',
                  fit: BoxFit.cover,
                  height: mHeight * .09,
                  width: mWidth * .25,
                ),
                Image.network(
                  'https://images.indianexpress.com/2015/03/sony-a6000-review.jpg',
                  fit: BoxFit.cover,
                  height: mHeight * .09,
                  width: mWidth * .25,
                ),
                Image.network(
                  'https://images.indianexpress.com/2015/03/sony-a6000-review.jpg',
                  fit: BoxFit.cover,
                  height: mHeight * .09,
                  width: mWidth * .25,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            padding: EdgeInsets.all(5),
            height: mHeight * .1,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Icon(Icons.repeat)),
                    Text(
                      '7 Days Replacement',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                VerticalDivider(
                  color: Colors.black,
                  endIndent: 10,
                  indent: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(child: Icon(Icons.money_sharp)),
                    Text(
                      'No Cash On Delivery',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            padding: EdgeInsets.all(5),
            height: mHeight * .1,
            color: Colors.white,
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            padding: EdgeInsets.all(5),
            height: mHeight * .4,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Highlights",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                LimitedBox(
                  maxHeight: mHeight * .3,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => ListTile(
                      leading: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      title: Text("Contrary to popular belief, Lorem Ipsum is not simply random text."),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(children: [Container(color: Colors.purple,)],),
    );
  }
}
