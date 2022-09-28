
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/product_details.dart';
import '../model/product_model.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: build_appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Women',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),),
            SizedBox(height: 5.0,),
            categories(),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250.0,
                crossAxisSpacing: 10,
                 mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              scrollDirection: Axis.vertical,
              itemCount: Product_details.length,
              itemBuilder: (BuildContext context, int index) {
                final Product item =  Product_details[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => details(item:item),),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(//height width same rakhna
                        child: Container(
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Hero(
                            tag:  "btn${item.id}",//So, each button has a different tag  in gridview.builder
                              child: Image.asset(item.image)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(item.title,
                        style: TextStyle(color: Colors.grey[400],fontSize: 15.0,fontWeight: FontWeight.bold),),
                      ),

                      Text('\$${item.price}',
                        style: TextStyle(color: Colors.grey,fontSize: 15.0,fontWeight: FontWeight.bold),),
                    ],
                  ),
                );
              }
          ),
        ),
          ],
        ),
      ),
      );
  }

  AppBar build_appbar(){
    return AppBar(
      backgroundColor:Colors.white,
      elevation: 0.0,
      leading: IconButton(icon:Icon(Icons.menu_outlined,color: Colors.grey,),onPressed: (){},),
      actions: <Widget>[
        IconButton(icon:Icon(Icons.search,color: Colors.grey,),onPressed: (){},),
        SizedBox(width: 25.0,),
        IconButton(icon:SvgPicture.asset('assets/icons/cart.svg',
          color: Colors.grey,),onPressed: (){},),
        SizedBox(width: 30.0,),
      ],
    );

  }
}

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  State<categories> createState() => _categoriesState();
}
class _categoriesState extends State<categories> {
  List<String> categories=['Hand bag','Jewellery','Footwear','Dresses'];
  int selectedindex=0;
   @override
  Widget build(BuildContext context) {
     return Container(
       width: MediaQuery.of(context).size.width,
       height: 60.0,
       child: ListView.builder(
           scrollDirection: Axis.horizontal,
           itemCount: categories.length,
           itemBuilder: (BuildContext context, index) {
             return GestureDetector(
               onTap: () {
                 setState(() {
                   selectedindex = index;
                 });
               },
               child: Padding(
                 padding: const EdgeInsets.only(top: 8.0),
                 child: Row(
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(categories[index],
                           style: TextStyle(
                             color: (selectedindex == index) ? Colors.black : Colors.grey,
                             letterSpacing: 1.2,
                             fontWeight: FontWeight.bold,
                             fontSize: 15.0,
                           ),),
                         SizedBox(width: 95.0,),
                         Padding(
                           padding: const EdgeInsets.only(top: 5.0),
                           child: Container(
                             height: 2.5,
                             width: 25.0,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(6.0),
                               color: (selectedindex == index) ? Colors.black : Colors.white,
                             ),
                           ),
                         )
                       ],
                     ),
                   ],
                 ),
               ),
             );
           }
       ),);
   }
  }




