import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.brown,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[100],
        ),
      ),
      home: MyHomePage(title: 'Hot singles bakery in your area'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          // backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
                name: "Croissant",
                description: "Croissant is gud",
                price: 50,
                image: "croissant.jpg"),
            ProductBox(
                name: "Pretzel",
                description: "Pretzel is gud",
                price: 50,
                image: "pretzel.jpg"),
            ProductBox(
                name: "Egg tart",
                description: "Egg tart is gud",
                price: 50,
                image:
                    "https://images.pexels.com/photos/6133403/pexels-photo-6133403.jpeg?cs=srgb&dl=pexels-regina-ferraz-6133403.jpg&fm=jpg",
                isUrl: true),
            ProductBox(
              name: "Baguette",
              description: "Baguette est bonne, oui oui",
              price: 100,
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Baguettes_-_stonesoup.jpg/511px-Baguettes_-_stonesoup.jpg",
              isUrl: true,
            ),
            ProductBox(
                name: "Raw Egg",
                description: "Raw Egg is not gud",
                price: 10,
                image:
                    "https://images.pexels.com/photos/7966366/pexels-photo-7966366.jpeg?cs=srgb&dl=pexels-felicity-tai-7966366.jpg&fm=jpg&w=1280&h=1920",
                isUrl: true),
            ProductBox(
              name: "Shin Ramyun Black",
              description:
                  "Shin Ramyun is a brand of instant noodle (including cup ramyeon) "
                  "that has been produced by the South Korean food company Nongshim"
                  "since 1 October 1986. It is now exported to over 100 countries, "
                  "and is the best-selling instant noodle brand in South Korea. ",
              price: 65,
              image: "shin_ramyun_black.jpg",
            )
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      this.description = "",
      this.price = 0,
      required this.image,
      this.isUrl = false})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String? image;
  final bool isUrl;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        // height: 150,
        constraints: BoxConstraints(
          minHeight: 150,
        ),
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              isUrl
                  ? Image.network(image!,
                      width: 200, height: 150, fit: BoxFit.cover)
                  : Image.asset("images/${image!}",
                      width: 200, height: 150, fit: BoxFit.cover),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )),
                ),
              )
            ])));
  }
}
