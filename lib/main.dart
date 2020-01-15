import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'menu_dashboard_widget.dart';

void main(){
  final Color _backgroundColor = Color(0xFF343442);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: _backgroundColor,//statusbar rengi
    statusBarIconBrightness: Brightness.light,//satusbar ıcon rengi
    systemNavigationBarColor: Colors.cyanAccent,//alttaki navigationbar rengi
    systemNavigationBarIconBrightness: Brightness.dark,//alttaki navvigation bar icon rengi
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    //sadece portraitte çalışır
    
  ]).then((_){
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu DashBoard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MenuDashBoard(),
    );
  }
}
