import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://avatars.githubusercontent.com/u/77788249?v=4";
    return Drawer(
        child: Container(
      color: Colors.teal,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('Shubham Sharma'),
                accountEmail: Text('shubhamku044@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                )),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text('Home',
                textScaleFactor: 1.4, style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text('Profile',
                textScaleFactor: 1.4, style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text('Mail me',
                textScaleFactor: 1.4, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    ));
  }
}
