import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:optimus/home/checkout.dart';
import 'package:optimus/widget/dashed_line.dart';
import 'package:optimus/widget/flutter_ticket_widget.dart';
import 'package:optimus/values/constant.dart';

var _itemCount=1;
bool _buttonPressed= false;

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: const CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: blueBG,
            floating: true,
            snap: true,
            title: Text("Cart (4 items)"),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child:  CartDetails(),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('₹950.00',style: TextStyle(fontSize: 21,color: Colors.red,fontWeight: FontWeight.w700),),
              SizedBox(
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
                      MaterialPageRoute(builder: (context) =>    const Checkout()),
                    );
                  },
                  child: const Text('Place Order '),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartDetails extends StatelessWidget {
  const CartDetails({Key? key}) : super(key: key);

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
                CartItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < 4; i++)
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 120,
                width: 130,
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffEFFBFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset("assets/image/product4.png",)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "Products Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      const Text("₹ 1.500.000",style: TextStyle(color: Colors.lightBlue,fontSize: 16),),
                      const SizedBox(height: 5,),
                      Row(
                        children: const [
                          Text("₹ 225000.00",style: TextStyle(fontSize: 12,decoration: TextDecoration.lineThrough,),),
                          Text("(20% Off)",style: TextStyle(color: Colors.lightBlue,fontSize: 12),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: _buttonPressed ? lightblue : iceBlue,
                        child: IconButton(
                            icon: const Icon(Icons.remove,size: 9,color: Colors.white,),
                            onPressed: () {
                              setState(() {
                                _itemCount--;
                                _buttonPressed = !_buttonPressed;
                              });
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_itemCount.toString()),
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: _buttonPressed ? lightblue : iceBlue,
                        child: IconButton(
                            icon: const Icon(Icons.add,color: Colors.white,size: 9,),
                            onPressed: () {
                              setState(() {
                                _itemCount++;
                                _buttonPressed = !_buttonPressed;
                              });
                            }),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 27,),
        const Text("Gift Cards, Vouchers & Promotional Codes",style: TextStyle(fontSize: 18),),
        const SizedBox(height: 11,),
         TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter Promo Code',
            hintStyle: const TextStyle(color: Colors.grey),
            // suffixText: 'Apply',
            suffixIcon: TextButton(
                child: const Text("Apply"),
                onPressed: (){
                  _showSimpleModalDialog(context);
                }
                ),
          ),
        ),
        const SizedBox(height: 15,),
        FlutterTicketWidget(
          color: const Color(0xffF2FBFE),
          width: MediaQuery.of(context).size.width,
          height: 160.00,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40,right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Subtotal",style: TextStyle(fontSize: 12),),
                    Text("₹900.00",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                  ],
                ),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Shipping cost",style: TextStyle(fontSize: 12),),
                    Text("₹50.00",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                  ],
                ),
                const SizedBox(height: 15,),
                const MySeparator(color:  Color(0xff9BE4FF)),
                const SizedBox(height: 18,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Payable Amount",style: TextStyle(fontSize: 16,),),
                    Text("₹950.00",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                  ],
                ),

              ],
            ),
          ),
        ),
        const SizedBox(height: 15,),
    ],
    );
  }
}

_showSimpleModalDialog(context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Stack(
            clipBehavior: Clip.none, alignment: AlignmentDirectional.topCenter,
            fit: StackFit.loose,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      const SizedBox(height: 70,),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(text: "‘LULUBT1000ADD’", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                            TextSpan(text: ' applied!'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 39,),
                      const Text("₹1000.00",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 43,),
                      const Text("savings with this coupon \n Keep using LULUBT1000ADD and save \n more with each order",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color(0xff8A8A8A)),),
                      const SizedBox(height: 27),
                      TextButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>    const Checkout()),
                          );
                        },
                        child:  const Text("YAY!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: Color(0xff00AEEF)),),
                      ),
                    ],
                  ),
                ),
              ),
                const Positioned(
                top: -50,
                child: CircleAvatar(
                  radius: 40,
                  // child:Image.asset('assets/image/discount.png',fit: BoxFit.cover,) ,
                  backgroundImage: AssetImage('assets/image/discount.png'),
                ),
              )
            ],
          ),
        );
      });
}

class Constants{
  Constants._();
  static const double padding =-30;
  static const double avatarRadius =45;
}

Widget buildDashedBorder({required Widget child}) => DottedBorder(child:child,);