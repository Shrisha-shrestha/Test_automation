import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/db.dart';
import '../sign.dart';
import 'Homescreen.dart';



class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user =Provider.of<theUser?>(context);
    if(user==null)
      {
        return authenticate();
      }
    else
      {
       return Home();
      }
  }
  }


