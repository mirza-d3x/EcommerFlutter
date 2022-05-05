import 'dart:ui';

import 'package:ecommerceapi/UI/colorList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.95);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              title: Text(
                'Shopsy',
                style: GoogleFonts.caveat(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x7D7D65EC), Colors.blue],
                    begin: FractionalOffset(0.5, 0.0),
                    end: FractionalOffset(0.0, 0.5),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FlexibleSpaceBar(),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .05,
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      decoration: BoxDecoration(
                       color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for something',
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.camera_alt)),
                      ),
                    ),
                  ),
                ),
              )
              // AppBar(
              //   elevation: 5,
              //   title: Container(
              //     width: double.infinity,
              //     height: 40,
              //     color: Colors.white,
              //     child: Center(
              //       child: TextField(
              //         decoration: InputDecoration(
              //             hintText: 'Search for something',
              //             prefixIcon: Icon(Icons.search),
              //             suffixIcon: Icon(Icons.camera_alt)),
              //       ),
              //     ),
              //   ),
              // ),
              ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                LimitedBox(
                  maxHeight: MediaQuery.of(context).size.height * .25,
                  child: PageView.builder(
                    pageSnapping: true,
                    controller: _pageController,
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
