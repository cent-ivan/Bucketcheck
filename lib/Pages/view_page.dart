import 'package:bucketcheck/ViewModels/bucket_viewModel.dart';
import 'package:bucketcheck/ViewModels/home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 20),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(164, 234, 205, 0.85),
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Bucket Lists", 
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 24)
              ),

              //Bucket List Buttons
              Consumer<BucketListViewModel>(builder: (context, bucketListValue, child) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bucketListValue.bucketLists.length,
                      itemBuilder: (cont, i) {
                        return Container(
                          width: 250,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromRGBO(139, 203, 176,1)
                          ),
                          child: Row(
                            children: [
                              //Texts found in the todo tile
                              Expanded(child: bucketListValue.displayBucketList(i)),

                              Expanded(
                                flex: 0,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios),
                                  iconSize: 20,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "My Checklists", 
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 24)
              ),

              //Check List Buttons
              Consumer<CheckListViewModel>(builder: (context, checkListValue, child) => Padding(
                  padding: const EdgeInsets.all(9),
                  child: Container(
                    height: 350,
                    child: ListView.builder(
                      itemCount: checkListValue.checkLists.length,
                      itemBuilder: (cont, i) {
                        return Container(
                          height: checkListValue.checkLists[i].isChecked == false ? 100:0,
                          width: checkListValue.checkLists[i].isChecked == false ? 200:0,
                          margin: const EdgeInsets.all(10),

                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromRGBO(139, 203, 176,1)
                          ),
                          child: Row(
                            children: [
                              if (checkListValue.checkList.isChecked == false)
                                //Check List Buttons
                                Consumer<CheckListViewModel>(builder: (context, checkListValue, child) => Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Container(
                                      height: 350,
                                      child: ListView.builder(
                                        itemCount: checkListValue.checkLists.length,
                                        itemBuilder: (cont, i) {
                                          return Container(
                                            height: checkListValue.checkLists[i].isChecked == false ? 100:0,
                                            width: checkListValue.checkLists[i].isChecked == false ? 200:0,
                                            margin: const EdgeInsets.all(10),

                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                              color: Color.fromRGBO(139, 203, 176,1)
                                            ),
                                            child: Row(
                                              children: [
                                                //not yet tested
                                                if (checkListValue.checkList.isChecked == false)
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
                        );
                      }
                    ),
                  ),
                )
              ),
              

            ],
          ),
        ),
      );

  }
}