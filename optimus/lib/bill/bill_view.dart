import 'package:flutter/material.dart';

class BillHome extends StatefulWidget {
  const BillHome({Key? key}) : super(key: key);

  @override
  _BillHomeState createState() => _BillHomeState();
}

class _BillHomeState extends State<BillHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003a63),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: SizedBox(
            width: 160.0,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: const BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Recharge',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text('Here Recharge'),
      ),
    );
  }
}
