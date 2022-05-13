import 'package:ecommerceapi/Api/Product/productModel.dart';
import 'package:ecommerceapi/UI/keyWordList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerceapi/UI/LoginScreen/LoginScreen.dart';
import 'package:ecommerceapi/UI/colorList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/Products/get_products_bloc.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late PageController _pageController;
  late List<ProductModel> productModel;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.95, keepPage: false);
    BlocProvider.of<GetProductsBloc>(context).add(GetProductsEventNew());
  }

  exit() {
    return SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        return exit();
      },
      child: Scaffold(
        //Sliver AppBar
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
                  icon: const Icon(Icons.logout),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
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
                  height: mHeight * .05,
                  child: Center(
                    child: Container(
                      height: mHeight * .05,
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
                  BlocBuilder<GetProductsBloc, GetProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is ProductsLoaded) {
                        productModel = BlocProvider.of<GetProductsBloc>(context)
                            .productModel;
                        return Column(
                          children: [
                            SizedBox(
                              height: mHeight * .05,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: keyWord.length,
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: color[index],
                                    borderRadius: BorderRadius.all(
                                      Radius.elliptical(30, 30),
                                    ),
                                  ),
                                  child: Text(
                                    keyWord[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ),
                            LimitedBox(
                              maxHeight: mHeight * .25,
                              child: PageView.builder(
                                pageSnapping: true,
                                controller: _pageController,
                                itemCount: productModel.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    print('Gesture Detected');
                                  },
                                  child: Container(
                                    width: mWidth * .97,
                                    height: mHeight * .4,
                                    color: color[index],
                                    child: Image.network(
                                      "https://picsum.photos/300/200",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mHeight * .4,
                              child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: productModel.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: .65),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: GestureDetector(
                                              onTap: () {
                                                print('Gesture Detected');
                                              },
                                              child: Container(
                                                height: mHeight * .4,
                                                width: mWidth * .4,
                                                decoration: BoxDecoration(
                                                  color: color[index],
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 8,
                                                      spreadRadius: 4,
                                                      offset: Offset(-5, 10),
                                                    ),
                                                  ],
                                                ),
                                                child: Image.network(
                                                  "https://picsum.photos/300/200",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )),
                              ),
                            ),
                            SizedBox(
                              height: mHeight * 1,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: productModel.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: .65),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: GestureDetector(
                                    onTap: () {
                                      print('Gesture Detected');
                                    },
                                    child: Container(
                                      height: mHeight * .4,
                                      width: mWidth * .4,
                                      decoration: BoxDecoration(
                                        color: color[index],
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 8,
                                            spreadRadius: 4,
                                            offset: Offset(-5, 10),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(
                                        "https://picsum.photos/200/300",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      if (state is ProductsError) {
                        return const Center(
                          child: Text(
                            'Error',
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }

                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Shopsy',
                              style: GoogleFonts.caveat(
                                fontSize: 100,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(
                              Icons.shopping_bag_rounded,
                              size: 50,
                            ),
                            const Text('Network Error'),
                          ],
                        ),
                      );
                    },
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
