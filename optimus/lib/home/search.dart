import 'package:flutter/material.dart';
import 'package:optimus/home/list.dart';
import 'package:optimus/values/constant.dart';
import 'cart.dart';
import 'home_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final List<String> items =
      List<String>.generate(10, (i) => 'SearchResult $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blueBG,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(child: Text("Shopping")),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.local_grocery_store_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: blueBG,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      color: blueBG,
                    ), //Container
                    Positioned(
                      top: 40,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                      ),
                    ), //Container
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.grey,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        height: 45.0,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchPage()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.search_outlined,
                                    color: Colors.grey.shade400,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'What are you looking for?',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Padding(
              //   padding:  EdgeInsets.only(top: 12.0,left:15.0),
              //   child: Text('Trending in Shopping',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontFamily: 'Roboto',
              //     fontWeight: FontWeight.w500,
              //   ),),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.33,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListPage()),
                        );
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.close_outlined),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const NewArrivals(),
        ],
      ),
    );
  }
}
