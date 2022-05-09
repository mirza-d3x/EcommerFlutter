import 'dart:io';

import 'package:ecommerceapi/UI/LoginScreen/LoginScreen.dart';
import 'package:ecommerceapi/UI/colorList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

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

  exit() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Do You Want Exit'),
        actions: [
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exit();
      },
      child: Scaffold(
        drawer: const Drawer(),
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
              actions: [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => ScreenLogin(),
                        ),
                        ModalRoute.withName('/'));
                  },
                ),
              ],
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0x7D7D65EC), Colors.blue],
                    begin: FractionalOffset(0.5, 0.0),
                    end: FractionalOffset(0.0, 0.5),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const FlexibleSpaceBar(),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .05,
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for something',
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Icon(Icons.camera_alt)),
                      ),
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
                  const SizedBox(
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
      ),
    );
  }
}
