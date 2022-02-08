import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:optimus/home/cart.dart';
import 'package:optimus/values/constant.dart';

bool _value = false;

class CheckoutAddress extends StatefulWidget {
  const CheckoutAddress({Key? key}) : super(key: key);

  @override
  _CheckoutAddressState createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: const CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: blueBG,
            pinned: true,
            floating: true,
            snap: true,
            title: Text("Delivery Address"),
            actions: [
              TextButton(
                  onPressed: null,
                  child: Text("Add New",style: TextStyle(color: Colors.white),)),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: AddressContents(),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: Padding(
          padding:  const EdgeInsets.only(left: 20,right: 20),
          child: SizedBox(
            width: 200,
            height: 50,
            child:  ElevatedButton(
              style:  ElevatedButton.styleFrom(
                primary:   Colors.lightBlue, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const Cart()),
                );
              },
              child:  const Text('Continue '),
            ),
          ),
        ),
      ),
    );
  }
}
class AddressContents extends StatelessWidget {
  const AddressContents({Key? key}) : super(key: key);

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
                AddressList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < 3; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.lightBlue.shade50,
                width: 1,
              ),
            ),
            child: CheckboxListTile(
              title: const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text('Lulu Exchange | Dubai',style: TextStyle(fontWeight: FontWeight.w500),),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 7,),
                  Text("Al Dana Tower, Street - 4 Al Rolla Street -Dubai -United Arab Emirates"),
                  SizedBox(height: 7,),
                  Text("Opening Hours: 10:00 AM | Closing Hours: 7:00 PM"),
                  SizedBox(height: 7,),
                  Text("Phone: +91-80-25500909",style: TextStyle(color: Colors.lightBlue,fontSize: 14),),
                  SizedBox(height: 10,),
                ],
              ),
              secondary: TextButton(onPressed: () {  },
              child: const Text('Edit'),),
              controlAffinity: ListTileControlAffinity.leading,
              autofocus: false,
              activeColor: Colors.green,
              checkColor: Colors.white,
              selected: _value,
              value: _value,
              onChanged: ( value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
