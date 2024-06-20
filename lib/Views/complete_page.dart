import 'package:bucketcheck/ViewModels/complete_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 35, 10, 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
         color: Color.fromRGBO(164, 234, 205, 0.85),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Consumer<CompletedViewModel>(builder: (context, completeValue, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        "Completed Checklists", 
                        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 18)
                      ),
                    ),

                    MaterialButton(
                      color: Colors.greenAccent,
                      elevation: 1,
                      onPressed: () => (completeValue.clearAll()),
                      child: const Text("Clear All"),
                    )
                  ],
                ),
                
                //Completed checklist list builder
                Padding(
                    padding: const EdgeInsets.all(9),
                    child: Container(
                      height: 450,
                      child: ListView.builder(
                        itemCount: completeValue.completedLists.length,
                        itemBuilder: (cont, i) {
                          return Container( //Box properties that contains checklists info
                            margin: const EdgeInsets.all(10),
                
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(139, 203, 176,1)
                            ),
                            child: Row(
                              children: [
                                Expanded(flex: 4, child: completeValue.displayCompleted(i)),
                                Expanded(
                                    child: IconButton(
                                      color: const Color.fromARGB(255, 168, 45, 45),
                                      icon: const Icon(Icons.delete),
                                      onPressed: () => completeValue.deleteCheck(i),
                                    ),
                                  )
                
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                  ),
            ],
          ),
        )

      )
    );
  }
}