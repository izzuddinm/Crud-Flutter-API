import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class Resume extends StatelessWidget {
  const Resume({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text(
            "Curriculum Vitae",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 100, 169, 204),
          actions: [
            IconButton(
              icon: Icon(Icons.message_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 228, 241, 252)),
                child: Text(
                    "A full-stack developer is a programmer who works within software development and is knowledgeable in both the front end and back end of an application. They work to create a seamless user experience through their diverse skill set. They're also well-versed in databases, server configuration and user interface."),
              ),
              _buildTitle("Skill"),
              SizedBox(
                height: 10,
              ),
              _buildSkillRow("Java", 200),
              SizedBox(
                height: 7,
              ),
              _buildSkillRow("Vue Js", 200),
              SizedBox(
                height: 7,
              ),
              _buildSkillRow("Flutter", 200),
              SizedBox(
                height: 7,
              ),
              _buildSkillRow("Java Script", 200),
              SizedBox(
                height: 17,
              ),
              _buildTitle("Experience"),
              SizedBox(
                height: 10,
              ),
              _buildExperienceRow(
                  company: "PT. GameLab Indonesia",
                  position: "3D Animation",
                  duration: "2021-2021"),
              _buildTitle("Education"),
              SizedBox(
                height: 10,
              ),
              _buildExperienceRow(
                  company: "SDIT Al-Uswah Tuban",
                  position: "Pelajar",
                  duration: "2010-2016"),
              _buildExperienceRow(
                  company: "SMPIT Al-Uswah Tuban",
                  position: "Pelajar",
                  duration: "2016-2019"),
              _buildExperienceRow(
                  company: "SMKIT Ihsanul Fikri Magelang",
                  position: "Pelajar",
                  duration: "2019-2022"),
              _buildTitle("Contact"),
              SizedBox(
                width: 0,
              ),
              ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.redAccent,
                ),
                title: Text("izzuddinm819@gmail.com"),
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.phone,
                  color: Colors.green,
                ),
                title: Text("085935362341"),
              ),
              _buildSocialRow(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSocialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.githubAlt),
          onPressed: () {},
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
          color: Colors.pink,
          icon: Icon(FontAwesomeIcons.instagram),
          onPressed: () {},
        ),
        IconButton(
            color: Colors.blue,
            icon: Icon(
              FontAwesomeIcons.facebookMessenger,
            ),
            onPressed: () {
              launch('https://pub.dev/packages/url_launcher/install');
            })
      ],
    );
  }

  Future<void> launch(String s) async {
    launch(s);
  }

  ListTile _buildExperienceRow(
      {required String company,
      required String position,
      required String duration}) {
    return ListTile(
      leading: Icon(
        Icons.work_history,
        color: Colors.blueGrey,
      ),
      title: Text(
        company,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("$position($duration)"),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 2,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        Flexible(
          flex: 5,
          child: LinearProgressIndicator(
            value: 0.75,
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Padding _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          // color: Color.fromARGB(255, 209, 124, 124),
          child: Row(
            children: [
              CircleAvatar(
                radius: 43,
                backgroundColor: Colors.pinkAccent,
                child: CircleAvatar(
                  radius: 37,
                  foregroundImage: AssetImage('images/ayom.JPG'),
                ),
              ),
              SizedBox(
                width: (30.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Muhammad Ayom Izzuddin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Fullstack Developer",
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      Text("Jakarta, Indonesia")
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
