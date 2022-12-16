
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){

          },
          child: Text('click me'),
        ),


        // child: IconButton(
        //   onPressed: () {
        //     FirebaseFirestore.instance
        //         .collection('Product_details')
        //         .get()//fetches documents for this query
        //         .then(
        //           (value) => value.docs.forEach(
        //             (element) {
        //           var docRef = FirebaseFirestore.instance
        //               .collection('Product_details')
        //               .doc(element.id);
        //           print(docRef.id);
        //           //docRef.update({'selected':true});
        //         },
        //       ),
        //     );
        //   },
        //   icon: Icon(Icons.done),
        // ),
      ),
    );
  }


}
