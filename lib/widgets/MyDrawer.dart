import 'package:flutter/material.dart';
import 'package:lagerverwaltung/domains/DrawerItem.dart';
import 'package:lagerverwaltung/pages/LagerPage.dart';
import 'package:lagerverwaltung/pages/LieferungPage.dart';
import 'package:lagerverwaltung/pages/ProductsPage.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  var drawerItems = [
    DrawerItem(Icons.storage, 'Lagerverwaltung'),
    DrawerItem(Icons.history, 'Lieferungen'),
    DrawerItem(Icons.assignment, 'Artikel')
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
          itemCount: drawerItems.length,
          itemBuilder: (_, index) {
            return Container(
              padding: EdgeInsets.all(6),
              child: ListTile(
                leading: Icon(drawerItems[index].icon),
                title: Text(drawerItems[index].pageTitle),
                onTap: () =>
                    _openOtherPage(context, drawerItems[index].pageTitle),
              ),
            );
          }),
    );
  }

  void _openOtherPage(BuildContext context, String page) {
    if (page == 'Lagerverwaltung') {
      Navigator.of(context).popAndPushNamed(LagerPage.route);
    } else if (page == 'Lieferungen') {
      Navigator.of(context).popAndPushNamed(LieferungPage.route);
    } else {
      Navigator.of(context).popAndPushNamed(ProductsPage.route);
    }
  }
}
