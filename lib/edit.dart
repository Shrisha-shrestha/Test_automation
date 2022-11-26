import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/db.dart';
import '../sign.dart';

class change extends StatefulWidget {
    @override
  State<change> createState() => _changeState();
}

class _changeState extends State<change> {

  String name='';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    theUser? user =Provider.of<theUser?>(context);
    if(user!=null){
      return StreamBuilder<currentuserdata>(
        stream: DatabaseSevice(uid: user!.uid).current,
        builder: (context,snapshot){
          if(snapshot.hasData){
            currentuserdata? ud = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Form(
                key:_formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 18.0,),
                    TextFormField(
                      initialValue: ud!.n,
                      validator:(val)=> val!.isEmpty ? 'Enter a name': null,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Theme.of(context).primaryColor),
                        ),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onChanged: (val){
                        setState(()=>name =val);
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Update',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                      ),
                      onPressed: ()async{
                        if(_formkey.currentState!.validate()) {
                          await DatabaseSevice(uid: user!.uid).updateUser(
                              name  ?? ud!.n,
                                ud!.e
                              );
                          Navigator.pop(context);
                        }
                      },
                    ),

                  ],
                ),
              ),
            );
          }
          else { return Text('error');}
        },

      );
    }
    else{
      return Text('Sign in first');
    }
  }
}
