import 'package:ecommerceapi/Api/Product/ProductIDModel.dart';
import 'package:ecommerceapi/Bloc/Products/GetProductsID/get_id_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../HomeScreen/homeScreen.dart';

class ScreenProduct extends StatefulWidget {
  ScreenProduct({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<ScreenProduct> createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct> {
  late List<ProductIdModel> productIdModel;

  @override
  void initState() {
    BlocProvider.of<GetIdProductBloc>(context).add(GetIdProductNew(widget.id));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<GetIdProductBloc, GetIdProductState>(
      builder: (context, state) {
        if (state is GetIdProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetIdProductLoaded) {
          productIdModel =
              BlocProvider.of<GetIdProductBloc>(context).productIdModel;
          return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => ScreenHome(),
                    ),
                    ModalRoute.withName('/'),
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),
              actions: const [
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
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.topLeft,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              productIdModel[0].productName.toString(),
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              productIdModel[0].price.toString(),
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
                  margin: const EdgeInsets.only(
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
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  padding: const EdgeInsets.all(5),
                  height: mHeight * .1,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircleAvatar(child: Icon(Icons.repeat)),
                          Text(
                            '7 Days Replacement',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      const VerticalDivider(
                        color: Colors.black,
                        endIndent: 10,
                        indent: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
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
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  padding: const EdgeInsets.all(5),
                  height: mHeight * .1,
                  color: Colors.white,
                  child: Text(
                    productIdModel[0].description.toString(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  padding: const EdgeInsets.all(5),
                  height: mHeight * .4,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Highlights",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      LimitedBox(
                        maxHeight: mHeight * .3,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) => const ListTile(
                            leading: Text(
                              '.',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text."),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: mHeight * .065,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {},
                      child: const Text('Add To Cart'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: mHeight * .065,
                    color: Colors.blue,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange),
                      ),
                      onPressed: () {},
                      child: const Text('Buy Now'),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is GetIdProductError) {
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
    );
  }
}
