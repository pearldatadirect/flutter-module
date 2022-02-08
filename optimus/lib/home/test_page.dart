import 'package:flutter/material.dart';
import 'package:optimus/values/constant.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: blueBG,
            title: Text('Delivery Address'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0,right: 10.0),
                child: Text("Add New",style: TextStyle(fontSize: 16),),
              ),
            ],
            pinned: true,
            expandedHeight: 155.0,
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexibleAppBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  height: 100,
                  color: Colors.grey,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  height: 100,
                  color: Colors.orange,
                ),
                Container(
                  height: 100,
                  color: Colors.pink,
                ),
                Container(
                  height: 100,
                  color: Colors.grey,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.red,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}



class MyFlexibleAppBar extends StatelessWidget {
  const MyFlexibleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
          ),
        ],),);
  }
}



