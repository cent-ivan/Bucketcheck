import 'package:bucketcheck/ViewModels/active_viewModel.dart';
import 'package:bucketcheck/Views/complete_page.dart';
import 'package:bucketcheck/Views/active_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ActiveViewModel activeValue = ActiveViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "My Bucket Checklist", 
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 26),
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
                      ActivePage(),
                      Completed()
                    ],
                  )
                )
              ],
            ),
          ),

        ),

        floatingActionButton: Consumer<ActiveViewModel>(builder: (context, activeValue, child) => SpeedDial(
          buttonSize: const Size(60, 60),
          backgroundColor: const Color.fromRGBO(139, 203, 176,1),
          overlayColor: const Color.fromARGB(148, 213, 212, 212),
          animatedIcon: AnimatedIcons.add_event,
          children: [
            //create checklist
            SpeedDialChild(
              labelBackgroundColor: const Color.fromRGBO(139, 203, 176,1),
              label: "Create Task",
              onTap: () => activeValue.addCheckList(context),
            )
            
          ],
        ),
      ),
    )
    );
  }
}