import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert';
import 'package:miniproject1/models/results.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        setState(() {
          _currentUser = account;
        });
      }
      _handleSignIn();
    });
  }

  //Handle sign out
  Future <http.Response> search(String item) async {
    final res = await http.post(
      Uri.parse(
          'https://api.nal.usda.gov/fdc/v1/foods/search?api_key=zoLDtB28FubnioDyjhhrgpp2rmkZAnHmf2G3QXVP'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "query": item,
      }),
    );

    return res;
  }

  Future<void> _handleSignOut() async {
    _googleSignIn.signOut();
  }

  Future<void> _handleSignIn() async {
    //handle sign in
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _currentUser;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var searchterm;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      user.displayName ?? '',
                      style: TextStyle(fontSize: 15),
                    )),
                IconButton(onPressed: _handleSignOut, icon: Icon(Icons.logout))
              ]),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (text) {
                        searchterm = text;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Search ingredients',
                          suffixIcon: IconButton(
                            icon: Icon(CupertinoIcons.camera),
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyScanner()));
                            },
                          )),
                    ),
                  )),
                  Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          var result = await search(searchterm);
                          Welcome welcome = new Welcome.fromJson(json.decode(result.body));
                          //Example of parsing
                          print(welcome.foods![0]!.ingredients);
                        },
                        icon: Icon(CupertinoIcons.search),
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
        ),
          floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyScanner()));
                }, icon: Icon(Icons.list)),
                IconButton(onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyScanner()));
                }, icon: Icon(CupertinoIcons.barcode_viewfinder))
              ]
          ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'You are not logged in.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
              ),
              ElevatedButton.icon(
                onPressed: _handleSignIn,
                label: Text('Login with Google!'),
                icon: Icon(Icons.login),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => null,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }
}






// Barcode Scanner
class MyScanner extends StatefulWidget {
  @override
  _MyScannerState createState() => _MyScannerState();
}

class _MyScannerState extends State<MyScanner> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      String obj = barcodeScanRes.substring(1);
      final response = await http.get(Uri.parse('https://api.nal.usda.gov/fdc/v1/foods/search?query=' + obj + '&pageSize=2&api_key=P0bCXahLXwmyB10bwd0T8ZqQNT7bNOyim4yiNm5V'));
      print((jsonDecode(response.body)));

    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: const Text('Barcode scan')),
          body: Builder(builder: (BuildContext context) {
            return Container(
                alignment: Alignment.center,
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () => scanBarcodeNormal(),
                          child: Text('Start barcode scan')),
                      Text('Scan result : $_scanBarcode\n',
                          style: TextStyle(fontSize: 20))
                    ]));
          }));
  }
}
