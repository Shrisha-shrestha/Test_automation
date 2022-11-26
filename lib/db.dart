import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseSevice{
  final String? uid;
  DatabaseSevice({this.uid});
  final CollectionReference usercollection = FirebaseFirestore.instance.collection('Users');
  Future updateUser(String name,String email) async{
    return await usercollection.doc(uid).set({
      'Name':name,
      'Email':email,
    });
  }
Stream<Userdata> get snaps{
    return usercollection.doc(uid).snapshots().map(_userdatalistfromsnap);
}


Userdata _userdatalistfromsnap(DocumentSnapshot snapshot ){
          return Userdata(
          nm: snapshot.get('Name') ?? '',
          em: snapshot.get('Email') ?? '',
      );
    }


  Stream<currentuserdata> get current{
    return usercollection.doc(uid).snapshots().map(_drawerupdater);
  }
  currentuserdata _drawerupdater(DocumentSnapshot snapshot)
  {
    return currentuserdata(
      uid: uid,
      n: snapshot.get('Name') ,
      e: snapshot.get('Email'),
    );
  }
}

class Userdata{
  final String em;
  final String nm;
  Userdata({required this.em,required this.nm});
}

class currentuserdata{
  final String? uid;
  final String e;
  final String n;
  currentuserdata({ this.uid,required this.e, required this.n});
}