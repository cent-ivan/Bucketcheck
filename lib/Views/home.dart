import 'package:bucketcheck/Views/complete_page.dart';
import 'package:bucketcheck/Views/view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void createBucket(){
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Bucket Checklist", 
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bg.png"),
              fit: BoxFit.cover
            )
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 13, 16, 10),
            child: Column(
              children: <Widget>[
                //Tab bar text
                TabBar(
                  tabs: const [
                    Tab(text: "Active",),
                    Tab(text: "Completed",)
                  ],
                  indicatorColor: Colors.green[300],
                  labelColor: Colors.green[300],
                ),

                const Expanded(
                  child: TabBarView(
                    children: [
                      ViewPage(),
                      Completed()
                    ],
                  )
                )
              ],
            ),
          ),
        ),

        floatingActionButton: SpeedDial(
          backgroundColor: const Color.fromRGBO(139, 203, 176,1),
          overlayColor: Colors.grey[400],
          animatedIcon: AnimatedIcons.add_event,
          children: [
            //Create bucket (not yet done)
            SpeedDialChild(
              labelBackgroundColor: const Color.fromRGBO(139, 203, 176,1),
              label: "Create Bucket"
            ),

            //create checklist (not yet done)
            SpeedDialChild(
              labelBackgroundColor: const Color.fromRGBO(139, 203, 176,1),
              label: "Create Task"
            ),
          ],
        ),
      ),
    );
  }
}