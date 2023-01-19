import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Main_Page extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");
    return Scaffold();
  }
}
