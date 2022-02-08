import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:optimus/home/cart.dart';
import 'package:optimus/values/constant.dart';
import 'checkout_address.dart';
import 'home_view.dart';

final List<String> imgList = [
  'assets/image/product1.png',
  'assets/image/product1.png',
  'assets/image/product1.png'
];
class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: blueBG,
            floating: true,
            snap: true,
            title: const Text("TMA2 Wireless"),
            actions: <Widget>[
              IconButton(
                icon:  const Icon(Icons.local_grocery_store_outlined),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const Cart()),
                  );
                },
              ),
            ],
          ),
          const SliverFillRemaining(
            hasScrollBody: true,
            child: PageContents(),
          )
        ],

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff00AEEF), // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const CheckoutAddress()),
                );
              },
              child: const Text('Buy Now '),
            ),
          ),
        ),
      ),
    );
  }
}
class PageContents extends StatelessWidget {
  const PageContents({Key? key}) : super(key: key);

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
              children: const [
                ScrollableContent(),
              ],
            ),
          ),
          const NewArrivals(),
        ],
      ),
    );
  }
}


class ScrollableContent extends StatelessWidget {
  const ScrollableContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                height: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.lightBlue.shade50,
                    width: 1,
                  ),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(),
                  items: imgList.map((item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(item, fit: BoxFit.cover, ),
                  )).toList(),
                )),
            Positioned(
              top: 15,
                left: 15,
                child: Image.asset('assets/image/tablezlogo.png')),
          ],
        ),
        const SizedBox(height: 30,),
        const Text("TMA-2HD Wireless",
          style: TextStyle(
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700
          ),),
        const SizedBox(height: 15,),
        const Text("₹ 1.500.000",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),),
        const SizedBox(height: 10,),
        Row(
          children: const  [
            Text("₹ 225000.00", style:  TextStyle(fontSize: 12,fontFamily: 'Roboto',fontWeight: FontWeight.w400,decoration: TextDecoration.lineThrough,color: Colors.grey),),
            Text("(20% Off)", style:  TextStyle(fontSize: 12,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: Colors.blue),),
          ],),
        const SizedBox(height: 10,),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(height: 10,),
        const Text("Colours",
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              color: Color(0xff979797)
          ),),
        Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.lightBlue,
                ),
              ),
              onPressed: () {},
              child: const Text('Blue'),
            ),
            const SizedBox(width: 10,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.lightGreen,
                ),
              ),
              onPressed: () { },
              child: const Text('Green',style: TextStyle(color: Colors.green),),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        const Text("Sizes",
          style: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              color: Color(0xff979797)
          ),),
        Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              onPressed: () { },
              child: const Text('XXS',style: TextStyle(color: Colors.grey),),
            ),
            const SizedBox(width: 10,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              onPressed: () { },
              child: const Text('XS',style: TextStyle(color: Colors.grey),),
            ),
            const SizedBox(width: 10,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              onPressed: () { },
              child: const Text('S',style: TextStyle(color: Colors.grey),),
            ),
            const SizedBox(width: 10,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              onPressed: () { },
              child: const Text('M',style: TextStyle(color: Colors.grey),),
            ),
            const SizedBox(width: 10,),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              onPressed: () { },
              child: const Text('L',style: TextStyle(color: Colors.grey),),
            ),

          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: const [
            Icon(Icons.swap_horiz_outlined,color: btnBlue,),
            SizedBox(width: 10,),
            Text("14 Days Free Return"),
            Spacer(),
            Icon(Icons.chevron_right_outlined,),
          ],
        ),
        const SizedBox(height: 10,),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(height: 10,),
        const Text("Description Product",style: TextStyle(fontFamily: 'Roboto',fontSize: 16,fontWeight: FontWeight.w700),),
        const SizedBox(height: 10,),
        const Text("The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",style: TextStyle(color: Colors.grey,fontFamily: 'Roboto',fontSize: 14,fontWeight: FontWeight.w400),),
        const SizedBox(height: 10,),
        const Text("The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ",style: TextStyle(color: Colors.grey,fontFamily: 'Roboto',fontSize: 14,fontWeight: FontWeight.w400),),
        const SizedBox(height: 10,),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}




