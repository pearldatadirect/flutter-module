import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:optimus/home/details.dart';
import 'package:optimus/home/search.dart';
import 'package:optimus/model/product.dart';
import 'package:optimus/values/constant.dart';

import 'cart.dart';

int index = 0;
List<ProductData> productDetails = [
  ProductData(
      url: 'assets/image/product5.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product1.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product2.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product3.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product4.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product5.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product1.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product2.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product3.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product4.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
  ProductData(
      url: 'assets/image/product5.png',
      name: 'Product Name',
      brand: 'Brand Name',
      mrp: '₹ 225000.00',
      saleprice: '₹ 1.500.000',
      discount: '(20%)'),
];
class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:  CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: blueBG,
            floating: true,
            snap: true,
            pinned: true,
            title: const Text("TMA2 Wireless"),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search_outlined,color: Colors.white,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const SearchPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.local_grocery_store_outlined,color: Colors.white,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const Cart()),
                  );
                },
              ),
            ],
          ),
          const SliverFillRemaining(
            hasScrollBody: true,
            child: ListContents(),
          ),
        ],
    ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(onPressed: (){_showBottomModal(context);}, label: const Text('sort'), icon: const Icon(Icons.swap_vert_outlined,),style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),),
            const VerticalDivider(),
            TextButton.icon(onPressed: (){_showFullModal(context);}, label: const Text('Filter'), icon: const Icon(Icons.filter_list_outlined,),
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),),
          ],
        ),
      ),
    );
  }
}
class ListContents extends StatelessWidget {
  const ListContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: blueBG,
                height: 60,
              ),
              Positioned(
                top: 30,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:productDetails.length,
                    itemBuilder: (context,index){
                      return  InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductDetails()),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 92,
                                      width: 88,
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.lightBlue.shade50,
                                          width: 1,
                                        ),
                                      ),
                                      child:  Image(
                                        image:
                                        AssetImage(productDetails[index].url),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productDetails[index].name,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          productDetails[index].brand,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          productDetails[index].saleprice,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              productDetails[index].mrp,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  decoration:
                                                  TextDecoration.lineThrough,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              productDetails[index].discount,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_showBottomModal(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return Container(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            // alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Center(child: Text("data")),
              ],
            ),
          ),
        );
      });
}
_showFullModal(context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false, // should dialog be dismissed when tapped outside
    barrierLabel: "Filter", // label for barrier
    transitionDuration: const Duration(milliseconds: 500), // how long it takes to popup dialog after button click
    pageBuilder: (_, __, ___) { // your widget implementation
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
            title: const Text(
              "Modal",
              style: TextStyle(color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0
        ),
        backgroundColor: Colors.white.withOpacity(0.90),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xfff8f8f8),
                width: 1,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Text("data"),
            ],
          ),
        ),
      );
    },
  );
}