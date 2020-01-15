import 'package:flutter/material.dart';

final TextStyle _menuFontStyle = TextStyle(color: Colors.white, fontSize: 20);
final Color _backgroundColor = Color(0xFF343442);

class MenuDashBoard extends StatefulWidget {
  @override
  _MenuDashBoardState createState() => _MenuDashBoardState();
}

class _MenuDashBoardState extends State<MenuDashBoard>
    with SingleTickerProviderStateMixin {
  double ekranYuksekligi, ekranGenisligi;
  bool menuAcikMi = false;
  AnimationController _animationController;
  Animation<double> _scaleAnimation;
  Animation<double> _scaleMenuAnimation;
  Animation<Offset> _menuOffSetAnimation;
  final Duration _duration = Duration(milliseconds: 300);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween(begin: 1.0, end: 0.6).animate(_animationController);
    _scaleMenuAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _menuOffSetAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ekranYuksekligi = MediaQuery.of(context).size.height;
    ekranGenisligi = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            menuOlustur(context),
            dashBoardOlustur(context),
          ],
        ),
      ),
    );
  }

  Widget menuOlustur(BuildContext context) {
    return SlideTransition(
      position: _menuOffSetAnimation,
      child: ScaleTransition(
        scale: _scaleMenuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Dashboard",
                  style: _menuFontStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Mesajlar",
                  style: _menuFontStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Utility Bills",
                  style: _menuFontStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Fund Transfer",
                  style: _menuFontStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Brancher",
                  style: _menuFontStyle,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashBoardOlustur(BuildContext context) {
    return AnimatedPositioned(
      duration: _duration,
      top: 0,
      bottom: 0,
      left: menuAcikMi ? 0.6 * ekranGenisligi : 0,
      right: menuAcikMi ? -0.4 * ekranGenisligi : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: menuAcikMi ? BorderRadius.circular(20) : null,
          elevation: 8,
          color: _backgroundColor,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (menuAcikMi) {
                                _animationController.reverse();
                              } else {
                                _animationController.forward();
                              }
                              menuAcikMi = !menuAcikMi;
                            });
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "My Cards",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Icon(
                          Icons.add_circle_outline,
                          color: Colors.blueAccent,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 200,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(20)),
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius: BorderRadius.circular(20)),
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              borderRadius: BorderRadius.circular(20)),
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(20)),
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),// scroll içi scrollwidget kullanmanı sağlıyor
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.verified_user),
                          title: Text("Ogrenci $index"),
                          trailing: Icon(Icons.add),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
