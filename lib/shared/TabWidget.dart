import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GFTabBarView(controller: tabController, children: <Widget>[
        Container(color: Colors.white),
        Container(color: Colors.white),
        Container(color: Colors.white),
      ]),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: GFTabBar(
            length: 3,
            controller: tabController,
            labelStyle: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.yellow, // Cambia el color de fondo del bottomNavigationBar
              height: 0.0,
            ),
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                child: Text(AppLocalizations.of(context)!.home),
              ),
              Tab(
                icon: Icon(Icons.supervisor_account),
                child: Text(AppLocalizations.of(context)!.account),
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                child: Text(AppLocalizations.of(context)!.cart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
