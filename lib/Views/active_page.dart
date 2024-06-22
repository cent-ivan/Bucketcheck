import 'package:bucketcheck/ViewModels/active_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivePage extends StatefulWidget {
  const ActivePage({super.key});

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(164, 234, 205, 0.7),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Consumer<ActiveViewModel>(builder: (context, activeValue, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                   Expanded(
                      child: Text(
                        ActiveViewModel.title, 
                        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 20)
                      ),
                    ),

                    IconButton(
                      onPressed: () => (activeValue.changeTitle(context)),
                      icon: const Icon(Icons.edit_rounded),
                    )
                  ],
                ),

                //Active Check List Tiles 
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 430,
                      child: ListView.builder(
                        itemCount: activeValue.db.checkLists.length,
                        itemBuilder: (cont, i) {
                          return Container( //Box properties that contains checklists info
                            margin: const EdgeInsets.all(10),

                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(139, 203, 176,1)
                            ),

                            //delete button
                            child: Row(
                              children: [
                                  Expanded(flex: 4, child: activeValue.displayCheckList(i, context)),
                                  Expanded(
                                    child: IconButton(
                                      color: const Color.fromARGB(255, 168, 45, 45),
                                      icon: const Icon(Icons.delete),
                                      onPressed: () => activeValue.deleteCheck(i),
                                    ),
                                  )
                                  
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                  )
              
              ]
            ),
          ),

        )
      );

  }
}