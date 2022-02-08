import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:optimus/widget/dashed_line.dart';
import 'package:optimus/widget/flutter_ticket_widget.dart';
import 'package:optimus/values/constant.dart';

var _itemCount=1;
bool _buttonPressed= false;

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
            child:  CheckoutDetails(),
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
                primary: btnBlue, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () { },
              child: const Text('Place Order '),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckoutDetails extends StatelessWidget {
  const CheckoutDetails({Key? key}) : super(key: key);

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
                CheckoutItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutItems extends StatefulWidget {
  const CheckoutItems({Key? key}) : super(key: key);

  @override
  State<CheckoutItems> createState() => _CheckoutItemsState();
}

class _CheckoutItemsState extends State<CheckoutItems> {
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
        Card(
          shape:  const OutlineInputBorder(
            borderSide: BorderSide(color:  Color(0xff9BE4FF), width: 1.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("LULUBT1000ADD",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,fontFamily: 'Roboto',color:  Color(0xff3D3D3D)),),
                    Text("Offer applied on the bill",style: TextStyle(height: 1.4,color:  Color(0xff3D3D3D)),),
                  ],
                ),
                const Icon(Icons.cancel_outlined,color: Colors.grey,),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15,),
        FlutterTicketWidget(
          color: const Color(0xffF2FBFE),
          width: MediaQuery.of(context).size.width,
          height: 170.00,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20,left: 40,right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Subtotal",style: TextStyle(fontSize: 12),),
                    Text("₹950.00",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Shipping cost",style: TextStyle(fontSize: 12),),
                    Text("₹50.00",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  <Widget>[
                    Row(
                      children: const [
                        Text("Voucher Discount ",style: TextStyle(fontSize: 12),),
                        Icon(Icons.info_outlined,size: 10,),
                      ],
                    ),
                    const Text("-₹1000.00",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xff05DE2A)),),
                  ],
                ),
                const SizedBox(height: 16,),
                const MySeparator(color:  Color(0xff9BE4FF)),
                const SizedBox(height: 17,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text("Payable Amount",style: TextStyle(fontSize: 16),),
                    Text("₹00.00",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
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


class Constants{
  Constants._();
  static const double padding =-30;
  static const double avatarRadius =45;
}