import 'package:flutter/material.dart';
import 'package:shop_app/sign.dart';
import 'package:shop_app/product_details.dart';
import 'package:shop_app/wrapper.dart';
import '../model/product_model.dart';
import '../Drawer.dart';
import 'package:provider/provider.dart';
import '../db.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
final AuthService _auth = AuthService();

dynamic user;
String? userEmail;
  @override
  Widget build(BuildContext context) {
    TabController _tabcontrol = TabController(length: 4, vsync: this);
    return StreamProvider<Userdata>.value(
          value: DatabaseSevice().snaps,
          initialData: new Userdata(nm: 'Sign in please', em: ''),
          child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(onPressed: ()async{
          }, icon: Icon(Icons.shopping_bag)),
          SizedBox(
            width: 30.0,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => wrapper(),
                ),
              );
            },
          ),
          SizedBox(
            width: 30.0,
          ),
          IconButton(onPressed: ()async{
            await _auth.signout();
          }, icon: Icon(Icons.logout)),
        ],
      ),
      drawer:Drawer(
        backgroundColor: Colors.white,
        width: 230.0,
        child: Drwr(),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Women',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    controller: _tabcontrol,
                    labelPadding: EdgeInsets.only(left: 15,right:15),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    tabs: [
                      Tab(text: 'Hand Bag',),
                      Tab(text: 'Jewellwery',),
                      Tab(text: 'Footwear',),
                      Tab(text: 'Dresses',),

                    ],
                  ),
                ),
              ),


              Expanded(
                child: TabBarView(
                  controller: _tabcontrol,
                  children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: Product_details.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Product item = Product_details[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => details(item: item),
                            ),
                          );
                        },
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                //height width same rakhna
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: item.color,
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Hero(
                                      tag:
                                          "btn${item.id}", //So, each button has a different tag  in gridview.builder
                                      child: Image.asset(item.image)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5.0),
                                child: Text(
                                  item.title,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                '\$${item.price}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),

                      );
                    }),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250.0,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: Product_details.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Product item = Product_details[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => details(item: item),
                                ),
                              );
                            },
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  //height width same rakhna
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: item.color,
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child: Hero(
                                        tag:
                                        "btn${item.id}", //So, each button has a different tag  in gridview.builder
                                        child: Image.asset(item.image)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '\$${item.price}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                          );
                        }),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250.0,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: Product_details.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Product item = Product_details[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => details(item: item),
                                ),
                              );
                            },
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  //height width same rakhna
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: item.color,
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child: Hero(
                                        tag:
                                        "btn${item.id}", //So, each button has a different tag  in gridview.builder
                                        child: Image.asset(item.image)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '\$${item.price}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                          );
                        }),
                    GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250.0,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: Product_details.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Product item = Product_details[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => details(item: item),
                                ),
                              );
                            },
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  //height width same rakhna
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: item.color,
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child: Hero(
                                        tag:
                                        "btn${item.id}", //So, each button has a different tag  in gridview.builder
                                        child: Image.asset(item.image)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  '\$${item.price}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                          );
                        }),

                  ]
              ),
              ),
            ],
          ),
      ),
    ),
        );
  }



}

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List<String> categories = ['Hand bag', 'Jewellery', 'Footwear', 'Dresses'];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: 50.0,
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
                child: Row(
                 children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          categories[index],
                          style: TextStyle(
                            color: (selectedindex == index)
                                ? Colors.black
                                : Colors.grey,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                            height: 2.5,
                            width: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: (selectedindex == index)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

            );
          }),
    );
  }
}

