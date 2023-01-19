import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> postData(Map<String, String> data) async {
  var result = await http.post(
    Uri.parse("http://127.0.0.1:8082/api/user/insert"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: json.encode(data),
  );
  print(result.statusCode);
  return result;
}

Future<http.Response> updateData(int id, Map<String, String> data) async {
  var result = await http.put(
    Uri.parse("http://127.0.0.1:8082/api/user/update/$id"),
    body: json.encode(data),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
    },
  );
  print(result.body);
  return result;
}

Future<http.Response> deleteData(id) async {
  var result = await http
      .delete(Uri.parse("http://127.0.0.1:8082/api/user/delete/${id}"));
  print(result.body);

  return result;
}

class NetworkingHttpApp extends StatefulWidget {
  NetworkingHttpApp({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  State<NetworkingHttpApp> createState() => _NetworkingHttpAppState();
}

class _NetworkingHttpAppState extends State<NetworkingHttpApp> {
  @override
  Widget build(BuildContext context) {
    Future<http.Response> getData() async {
      var result =
          await http.get(Uri.parse("http://127.0.0.1:8082/api/user/getData"));
      setState(() {
        result;
      });
      return result;
    }

    var data = getData();

    final add1 = TextEditingController();
    final add2 = TextEditingController();
    final add3 = TextEditingController();
    final update1 = TextEditingController();
    final update2 = TextEditingController();
    final update3 = TextEditingController();

    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference users = firestore.collection("users");

    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          // focusColor: Colors.white,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Form(
                        // key: _keyDialogForm,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: add1,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.people),
                                  hintText: "Input Your Name"),
                              // maxLength: 8,
                              textAlign: TextAlign.start,
                            ),
                            TextFormField(
                              controller: add2,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.email),
                                  hintText: "Input Your Email"),
                              // maxLength: 8,
                              textAlign: TextAlign.start,
                              onSaved: (val) {
                                // titleController.text = val;
                              },
                            ),
                            TextFormField(
                              controller: add3,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.man),
                                  hintText: "Input Your Gender"),
                              // maxLength: 8,
                              textAlign: TextAlign.start,
                              onSaved: (val) {
                                // titleController.text = val;
                              },
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {
                            postData(
                              {
                                "nama": add1.text,
                                "email": add2.text,
                                "gender": add3.text
                              },
                            );
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ));
          },
          backgroundColor: Color.fromARGB(255, 81, 88, 127),
          child: Icon(Icons.add_circle_outline),
        ),
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          toolbarHeight: 50,
          centerTitle: true,
          // leading: const Icon(Icons.priority_high),
          leadingWidth: 200,
          title: const Text(
            "CRUD API",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Color.fromARGB(255, 81, 88, 127),
        ),

        // body: Stack(children: <Widget>[
        //   ListView(
        //     children: <Widget>[
        //       StreamBuilder(
        //         stream: users.snapshots(),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData) {
        //             return Column(
        //               children: [
        //                 ListView.builder(
        //                   itemCount: snapshot.data!.docs.length,
        //                   itemBuilder: (context, index) {
        //                     var user = snapshot.data!.docs.elementAt(index).data
        //                         as Map<String, dynamic>;
        //                     return ListTile();
        //                   },
        //                 ),
        //               ],
        //             );
        //           }
        //         },
        //       )
        //     ],
        //   )
        // ]),
        body: FutureBuilder<http.Response>(
          future: data,
          builder: (context, snapshot) {
            // print(json[0]);
            if (snapshot.hasData) {
              List<dynamic> json = jsonDecode(snapshot.data!.body);
              return ListView.builder(
                itemCount: json.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(json[index]["nama"] ?? ""),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(json[index]["email"] ?? ""),
                        Text(json[index]["gender"] ?? ""),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_note),
                          onPressed: () {
                            add1.text = json[index]["nama"];
                            add2.text = json[index]["email"];
                            add3.text = json[index]["gender"];
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Form(
                                        // key: _keyDialogForm,
                                        child: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              controller: add1,
                                              decoration: const InputDecoration(
                                                  icon: Icon(Icons.people),
                                                  hintText: "Input Your Name"),
                                              textAlign: TextAlign.center,
                                              onSaved: (val) {
                                                // titleController.text = val;
                                              },
                                            ),
                                            TextFormField(
                                              controller: add2,
                                              decoration: const InputDecoration(
                                                  icon: Icon(Icons.email),
                                                  hintText: "Input Your Email"),
                                              // maxLength: 8,
                                              textAlign: TextAlign.center,
                                              onSaved: (val) {
                                                // titleController.text = val;
                                              },
                                            ),
                                            TextFormField(
                                              controller: add3,
                                              decoration: const InputDecoration(
                                                  icon: Icon(Icons.man),
                                                  hintText:
                                                      "Input Your Gender"),
                                              // maxLength: 8,
                                              textAlign: TextAlign.center,
                                              onSaved: (val) {
                                                // titleController.text = val;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        IconButton(
                                          onPressed: () {
                                            updateData(
                                                json[index]["id"] ?? "", {
                                              "nama": add1.text,
                                              "email": add2.text,
                                              "gender": add3.text
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                            Icons.edit_attributes,
                                          ),
                                        ),
                                      ],
                                    ));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline),
                          onPressed: () {
                            deleteData(json[index]["id"]);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
