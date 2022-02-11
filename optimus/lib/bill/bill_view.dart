import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const channel = "com.luluone.lite";
const platformChannel = MethodChannel(channel);

class BillHome extends StatefulWidget {
  const BillHome({Key? key}) : super(key: key);

  @override
  _BillHomeState createState() => _BillHomeState();
}

class _BillHomeState extends State<BillHome> {

  @override
  void initState() {
    super.initState();
    _getParam();
  }

  var _param = "";

  Future<void> _getParam() async {
    String param;
    try {
      final String result = await platformChannel.invokeMethod('getParam');
      param = result;
      print(param);
    } on PlatformException catch (e) {
      param = "Failed to get param: '${e.message}'";
      print(param);
    }

    setState(() {
      _param = param;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003a63),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            platformChannel.invokeMethod('exitFlutter');
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
              child:  Row(
                children: const [
                   Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "Recharge",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body:  Center(
        child: Text(_param),
      ),
    );
  }
}
