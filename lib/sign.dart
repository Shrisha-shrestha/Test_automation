import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/model/db.dart';
import 'home/register.dart';
import 'home/signin.dart';

class authenticate  extends StatefulWidget {
  @override
  State<authenticate> createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  bool showsignin = true;
  void toggle(){
    setState(() {
      showsignin=!showsignin;
    });
  }
 @override
  Widget build(BuildContext context) {
   if(showsignin){
     return SignIn(toggle: toggle,);
   }
     else{
     return Register(toggle:toggle,);

   }
   }
  }

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  theUser? _userFromfireuser(User  user){
    return user != null ? theUser(uid: user.uid):null;
  }

  Stream<theUser?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromfireuser(user!));
  }

  Future signAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? currentuser = result.user;
      return _userFromfireuser(currentuser!);
    }
    catch(e){
      print('e1');
      print(e.toString());
      return null;
    }
  }

  Future regwithEandP(String Email,String Password) async{
    try{
      UserCredential result =await _auth.createUserWithEmailAndPassword(email:Email, password: Password);
      User? coming_user =result.user;

      await  DatabaseService(uid:coming_user!.uid).updateusername('Default username');
      return _userFromfireuser(coming_user!);

    }
        catch(e){
      print(e.toString());
      return null;
        }
  }


  Future sign_in(String Email,String Password) async{
    try{
      UserCredential result =await _auth.signInWithEmailAndPassword(email:Email, password: Password);
      User? alr_user =result.user;
      return _userFromfireuser(alr_user!);
    }
    catch(e){
      print('object');
      print(e.toString());
      return null;
    }
  }


  Future signout() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print('lololololololol');
      print(e.toString());
      return null;
    }
  }
}


