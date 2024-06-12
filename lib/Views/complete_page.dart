import 'package:bucketcheck/ViewModels/home_viewModel.dart';
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
        decoration: const BoxDecoration(
         color: Color.fromRGBO(164, 234, 205, 0.85),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bucket Lists", 
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 24)
              ),

              Consumer<CheckListViewModel>(builder: (context, checkListValue, child) => Padding(
                  padding: const EdgeInsets.all(9),
                  child: Container(
                    height: 280,
                    child: ListView.builder(
                      itemCount: checkListValue.checkLists.length,
                      itemBuilder: (cont, i) {
                        return Container(
                          height: checkListValue.checkLists[i].isChecked == true ? 100:0,
                          width: checkListValue.checkLists[i].isChecked == true ? 200:0,
                          margin: const EdgeInsets.all(10),

                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromRGBO(139, 203, 176,1)
                          ),
                          child: Row(
                            children: [
                              //not yet tested
                              if (checkListValue.checkList.isChecked == true)
                              Expanded(
                                flex: 0,
                                child: Checkbox(
                                  activeColor: const Color.fromRGBO(139, 203, 176,1),
                                  value: checkListValue.checkLists[i].isChecked,
                                  onChanged: (value) => checkListValue.changeCheckBox(value, i),
                                ),
                              ),

                              Expanded(child: checkListValue.displayCheckList(i)),

                              Expanded(
                                flex: 0,
                                child: IconButton(
                                  onPressed: () => checkListValue.deleteCheck(i),
                                  icon: const Icon(Icons.delete),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                )
              ),
          ],
        ),
      )
    );
  }
}