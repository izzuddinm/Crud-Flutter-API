import 'package:flutter/material.dart';

class CommerceApp extends StatefulWidget {
  const CommerceApp({super.key});

  @override
  State<CommerceApp> createState() => _CommerceAppState();
}

class _CommerceAppState extends State<CommerceApp> {
  bool isDark = false;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // brightness: isDark ? Brightness.dark : Brightness.light,
          brightness: Brightness.dark),
      home: _ShopPage(),
    );
  }
}

class _ShopPage extends StatefulWidget {
  const _ShopPage({super.key});

  @override
  State<_ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<_ShopPage> {
  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    bool isFav = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // brightness: isDark ? Brightness.dark : Brightness.light,
          brightness: Brightness.dark),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Tokoku"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const _FavoritePage()),
                    );
                  },
                  icon: Icon(Icons.add_shopping_cart_outlined)),
              Switch(
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    isDark = value;
                  });
                },
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: productData.length,
            itemBuilder: (context, index) {
              return ProductCard(product: productData[index]);
            },
          )),
    );
  }
}

class _FavoritePage extends StatefulWidget {
  const _FavoritePage({super.key});

  @override
  State<_FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<_FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorite"),
          actions: const [],
        ),
        body: ListView.builder(
          itemCount: productData.length,
          itemBuilder: (context, index) {
            if (productData[index].isFav) {
              return ProductCard(product: productData[index]);
            } else
              return Container();
          },
        ));
  }
}

class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Container(
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.white)),
        // padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(8),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(widget.product.productImage),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.productName),
                    Text("${widget.product.productPrice}")
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.product.favorite();
                  });
                },
                icon: widget.product.isFav
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_rounded))
          ],
        ),
      ),
    );
  }
}

List<Product> productData = [
  Product(
      productPrice: "Rp. 120.000",
      productName: "Rugby T-Shirt",
      productImage: "images/rugbyy.PNG"),
  Product(
      productPrice: "Rp. 120.000",
      productName: "Ankle Pants",
      productImage: "images/angklepants.png"),
  Product(
      productPrice: "Rp. 120.000",
      productName: "Hoodie",
      productImage: "images/hoodie.png")
];

class Product {
  String productName;
  String productPrice;
  String productImage;
  bool isFav = false;
  Product(
      {required this.productPrice,
      required this.productName,
      this.productImage = "images/rugbyy.PNG"});

  void favorite() {
    isFav = !isFav;
  }
}
