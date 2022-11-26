import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/model/product_model.dart';

class details extends StatelessWidget {
  final Product item;
  details({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.color,
      appBar: AppBar(backgroundColor: item.color,elevation: 0.0,
        leading: BackButton(
          color: Colors.white,),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.shopping_bag_outlined,color: Colors.white,),onPressed: (){},),
          SizedBox(width: 25.0,),
          IconButton(icon:SvgPicture.asset('assets/icons/cart.svg',
            color: Colors.white,),onPressed: (){},),
          SizedBox(width: 30.0,),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.28),
              height:  MediaQuery.of(context).size.height*0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25.0),topLeft: Radius.circular(25.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 60.0),
                child: Column(
                  children: <Widget>[
                    Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Color',style: TextStyle(color: Colors.grey),),
                                  colorpicker(),

                                ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Size',style: TextStyle(color: Colors.grey),),
                              Text('${item.size} cm',style: TextStyle(color: Colors.black,
                              fontSize: 25.0,fontWeight: FontWeight.bold)),
                              //ColorDot(color: Color(0xFFA29B9B)),
                            ],
                          ),),
                        ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 12,),
                    count(),
                    SizedBox(height: 22,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              height: 42,
                              width:66,
                              decoration: BoxDecoration(
                                border: Border.all(color: item.color),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                              child: Icon(Icons.add_shopping_cart_outlined,size: 20.0,
                                color: item.color)
                          ),

                          TextButton(onPressed: (){},
                              style: TextButton.styleFrom(
                                backgroundColor: item.color,
                                minimumSize: Size(MediaQuery.of(context).size.width*0.6, 40.0),
                                  shape: StadiumBorder(),
                              ),
                              child: Text('BUY NOW',style: TextStyle(
                                color: Colors.white,
                              ),))
                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height*0.05,
              right:MediaQuery.of(context).size.width*0.01,
              child: Container(
                height: 265.0,
                child: Hero(
                  tag: "btn${item.id}",
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('The Aristocratic Hand Bag ',
                  style: TextStyle(color: Colors.white)),
                  SizedBox(height:5.0),
                  Text(item.title,
                      style: TextStyle(
                        fontSize: 38.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                        Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price',
                          style: TextStyle(color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height:5.0),
                      Text('\$${item.price}',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),                  //Image.asset(item.image),

                ],
              ),
            ],
          ),
        ),


          ],
        ),
      )
    );
  }
}

class colorpicker extends StatefulWidget {
    colorpicker({Key? key}) : super(key: key);
  @override
  State<colorpicker> createState() => _colorpickerState();
}

class _colorpickerState extends State<colorpicker> {
  List<Color> colors=[Color(0xFF356C95), Color(0xFFF8C078),Color(0xFFA29B9B)];
  int isSelected=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, index) {
         return Row(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  isSelected=index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 2.0,right: 5.0),
                padding: EdgeInsets.all(3.0),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:isSelected==index?Colors.blue:Colors.transparent,
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors[index],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
          );
          }
      ),
    );
  }
}

class count extends StatefulWidget {
  const count({Key? key}) : super(key: key);

  @override
  State<count> createState() => _countState();
}

class _countState extends State<count> {
  int counter=1;
  bool fav=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            OutlinedButton(onPressed: (){
              setState((){counter=counter+1;});
            }, child:Icon(Icons.add),
            style: OutlinedButton.styleFrom(minimumSize: Size(10.0,30.0 )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('${counter}',style: TextStyle(fontSize: 25.0),),
            ),
            OutlinedButton(onPressed: (){setState((){if (counter!= 0) counter--;});},
                style: OutlinedButton.styleFrom(minimumSize: Size(10.0,30.0 )),
                child:Icon(Icons.remove)),
          ],
        ),
        GestureDetector(
          onTap: (){setState(() {
            fav=!fav;
          });},
          child: Container(
            padding: EdgeInsets.all(2),
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                border: Border.all(color: fav==true?Color(0xFFFF6464):Colors.grey,),
                              shape: BoxShape.circle,
            ),
            child: Icon(Icons.favorite,size: 20.0,
              color: fav==false?Colors.grey:Color(0xFFFF6464),)
          ),
        )
      ],
    );
  }
}


