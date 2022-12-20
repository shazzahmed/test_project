import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:test_project/blocs/HomeBloc.dart';
import 'package:test_project/blocs/LoginBloc.dart';
import 'package:test_project/screen/LoginPage.dart';
import 'package:test_project/services/shared_preferences_services.dart';
import 'package:test_project/views/MainScreen.dart';

Future<void> main() async {
  if (defaultTargetPlatform != TargetPlatform.android ||
      defaultTargetPlatform != TargetPlatform.iOS) {
    /// For desktop apps only
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }else{
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferencesService.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => LoginBloc()),
      ChangeNotifierProvider(create: (context) => HomeBloc()),
    ],
    child: OverlaySupport(
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: const Color.fromRGBO(17, 19, 21, 1),
      ),
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(title: 'Flutter POS'),
      home: LoginPage(),
    )
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: MainScreen(),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
