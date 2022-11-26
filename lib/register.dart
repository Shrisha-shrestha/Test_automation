import 'package:flutter/material.dart';
import 'package:shop_app/sign.dart';
import 'loading.dart';


class Register extends StatefulWidget {
  final Function toggle;
  Register({ required this.toggle });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String password='';
  String email='';
  String error='';
  bool load=false;

  @override
  Widget build(BuildContext context) {
    return load?loading():Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            widget.toggle();
          }, child: Text('Sign in',style: TextStyle(color: Colors.grey),))
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Sign Up',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
            key:_formkey,
            child: Column(
            children: <Widget>[
              SizedBox(height: 18.0,),
              TextFormField(
                validator:(val)=> val!.isEmpty ? 'Enter an email': null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Theme.of(context).primaryColor),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onChanged: (val){
                  setState(()=>email =val);
                },
              ),
              SizedBox(height: 18.0,),
              TextFormField(
                validator:(val)=> val!.length<6 ? 'Enter a  password 6 characters long': null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide( color: Theme.of(context).primaryColor),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                ),
                obscureText: true,
                onChanged: (val){
                  setState(()=>password =val);
                },
              ),
              SizedBox(height: 50.0,),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Register',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                  ),
                  onPressed: ()async{
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        load=true;
                      });
                      dynamic result = await  _auth.regwithEandP(email, password);
                      if (result == null)
                        {
                          setState(() {
                            load=false;
                            error ='Please supply a valid email';
                          });
                        }
                    }

                 }
              ),
              
              SizedBox(height: 25,),
              Text(error,style: TextStyle(color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}
