import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/db.dart';
import 'package:shop_app/sign.dart';
import 'wrapper.dart';
import 'edit.dart';


class Drwr extends StatefulWidget {
  const Drwr({Key? key}) : super(key: key);

  @override
  State<Drwr> createState() => _DrwrState();
}

class _DrwrState extends State<Drwr> {


  String name='';
  var currentUser = FirebaseAuth.instance.currentUser;

  void _showSettingsPanel() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: change(),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    theUser? user =Provider.of<theUser?>(context);
    if(user!=null){
      return StreamBuilder<currentusername>(
        stream: DatabaseService(uid: user!.uid).current,
        builder: (context,snapshot){
          if(snapshot.hasData){
            currentusername? ud = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView(
                padding: EdgeInsets.all(5),
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.black54),
                    accountName: Text(ud!.n),
                    accountEmail: Text('${FirebaseAuth.instance.currentUser!.email}'),
                    currentAccountPicture: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.white,
                      child: Text(
                        '${ud!.n[0]}'.toUpperCase(),
                        style: TextStyle(fontSize: 40.0,color: Colors.black54),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined), title: Text("Sign in"),
                    onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => wrapper(),
                      ),
                    );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.edit), title: Text("Change Username"),
                    onTap: () {
                      _showSettingsPanel();
                    },
                  ),
                ],
              ),
            );
          }
          else { return Text('error');}
        },

      );
    }
    else{
      return ListView(
        padding: EdgeInsets.all(5),
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black54),
            accountName: Text('Sign in please'),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              radius: 20.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.asset('assets/images/pp.jpg')
              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined), title: Text("Sign in"),
            onTap: () {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => wrapper(),
              ),
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.edit), title: Text("Change Username"),
            onTap: () {
              _showSettingsPanel();
            },
          ),
        ],
      );
    }
  }    // return
  }

