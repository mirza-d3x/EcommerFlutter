import 'package:ecommerceapi/UI/colorList.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            title: Text('Shopsy'),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              elevation: 5,
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt)),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                LimitedBox(
                  maxHeight: MediaQuery.of(context).size.height * .25,
                  child: ListView.builder(
                    itemCount: color.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width * .97,
                      height: MediaQuery.of(context).size.height * .4,
                      color: color[index],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  child: Center(
                    child: Text(
                      'This is an awesome shopping platform',
                    ),
                  ),
                ),
                Container(
                  height: 1000,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

