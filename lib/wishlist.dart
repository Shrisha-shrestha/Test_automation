import 'package:flutter/material.dart';

import '../model/product_model.dart';
import 'cart/cart.dart';

class wish extends StatefulWidget {
  final Product item;final int counter,total;
  wish({Key? key, required this.item,required this.counter,required this.total}) : super(key: key);
  @override
  State<wish> createState() => _wishState();
}

class _wishState extends State<wish> {
  int _itemCount = 1,total=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('WISHLIST',style: TextStyle(color: Colors.black,letterSpacing: 2.0),),
        centerTitle: true,
        backgroundColor: Colors.white,elevation: 0.0,
        leading: BackButton(
          color: Colors.black54,),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.shopping_cart_checkout,color: Colors.black54,),
            onPressed: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => cart(item: widget.item, counter: widget.counter, total: widget.total)
              //   ),
              // );
            },),
          SizedBox(width: 25.0,),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context,builder) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          // color: wish.color, // Your desired background color
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20),
                          ]
                      ),
                      child: ListTile(
                        tileColor: Colors.white,
                        leading: Container(
                          width: 80.0,
                          child: Image.asset('${widget.item.image}'),
                          decoration: BoxDecoration(
                            color: Colors.white, // Your desired background color
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        trailing: SizedBox(
                          width: 105.0,
                          child: Row(
                            children: <Widget>[
                              IconButton(icon: new Icon(Icons.remove, color: Colors
                                  .white,), onPressed: () =>
                                  setState(() {
                                    if(_itemCount != 0 ) {
                                      _itemCount--;
                                      total = total - (_itemCount*widget.item.price);}
                                    else{ print(
                                        'Error');   //use remove function later
                                    }
                                  }
                                  ),
                              ),
                              Text(_itemCount.toString(), style: TextStyle(color: Colors
                                  .white),),
                              IconButton(icon: Icon(Icons.add, color: Colors.white,),
                                  onPressed: () => setState(() {
                                    _itemCount++;
                                    total = total + (_itemCount*widget.item.price);
                                  }
                                  ))
                            ],
                          ),
                        ),
                        title: Text('${widget.item.title}',
                          style: TextStyle(color: Colors.white,),),
                        subtitle: Text('Color - black' "\$\n${widget.item.price}",
                            style: TextStyle(color: Colors.white,)),
                        isThreeLine: true,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.6,),
                    Divider(
                      color: Colors.black,
                      height: 20.0,
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: TextStyle(
                          fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),
                        ),),
                        Text('\$${widget.total}',style: TextStyle(
                            fontSize: 20.0,fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ],
                ),
              );

            }
        ),
      ),
    );
  }
}
