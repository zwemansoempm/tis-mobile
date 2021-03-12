import 'package:flutter/material.dart';
import 'package:tis/views/term.dart';
import 'package:tis/views/privacy.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen();
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        leading: BackButton(color: Colors.black,onPressed: (){
          Navigator.pop(context);
        }),
        title: Text('Settings', style: TextStyle(color: Colors.black)),
      ),
      body: ListView(      
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('利用規約'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>const Term()));
              },
            ),
            ListTile(
              title: Text('プライバシーポリシー'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Privacy()));
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}
