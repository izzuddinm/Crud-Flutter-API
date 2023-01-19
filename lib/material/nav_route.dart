import "package:flutter/material.dart";

class User {
  String name;
  int age;
  User({required this.name, required this.age});
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    List<User> data = [
      User(name: "boni", age: 12),
      User(name: "bote", age: 14)
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Halaman 1")),
      body: SafeArea(
          child: ListView(
        children: [
          ListTile(
            title: Text(data[0].name),
            onTap: () {
              Navigator.pushNamed(context, PageTwo.routeName, arguments: {
                "user": data[0],
                "pesan": "ini pesan user ${data[0].name}"
              });
            },
          ),
          ListTile(
            title: Text(data[1].name),
            onTap: () {
              Navigator.pushNamed(context, PageTwo.routeName, arguments: {
                "user": data[1],
                "pesan": "ini pesan user ${data[1].name}"
              });
            },
          )
        ],
      )
          //     child: Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Navigator.of(context).push(MaterialPageRoute(
          //       //   builder: (context) => PageTwo(),
          //       // ));
          //       Navigator.pushNamed(context, "/pagetwo");
          //     },
          //     child: Text("halaman 2"),
          //   ),
          // )
          ),
    );
  }
}

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  static const routeName = "/pagetwo";

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> param =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    User detailUser = param["user"] as User;
    String pesan = param["pesan"] as String;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(detailUser.name),
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        children: [Text("${detailUser.age}"), Text(pesan)],
      ))),
    );
  }
}

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageOne(),
    );
  }
}

class RouteExample extends StatelessWidget {
  const RouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        PageOne.routeName: (context) => PageOne(),
        PageTwo.routeName: (context) => PageTwo()
      },
      initialRoute: PageOne.routeName,
      // home: ,
    );
  }
}
