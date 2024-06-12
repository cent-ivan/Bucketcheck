import 'package:flutter/material.dart';
import 'package:bucketcheck/Models/check_list_model.dart';

class CheckListViewModel extends ChangeNotifier{
  CheckList checkList = CheckList();
  List<CheckList> checkLists = [
    CheckList(checkListName: "Clean Sofa", place: "Living Room", checkListDate: DateTime.now(), isChecked: false),
    CheckList(checkListName: "Clean Sofa", place: "Living Room", checkListDate: DateTime.now(), isChecked: false),
    CheckList(checkListName: "Clean Sofa", place: "Living Room", checkListDate: DateTime.now(), isChecked: false),
    CheckList(checkListName: "Clean Sofa", place: "Living Room", checkListDate: DateTime.now(), isChecked: false)
  ];

  Widget displayCheckList(i){
    if (checkLists[i].isChecked == true){
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${checkLists[i].checkListName}", style: const TextStyle(decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold),),
            Text("${checkLists[i].place}", style: const TextStyle(fontSize: 14),),
            const SizedBox(
              height: 15,
            ),
            Text("${checkLists[i].checkListDate}", style: const TextStyle(fontSize: 14),),
          ],
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${checkLists[i].checkListName}", style: const TextStyle(fontWeight: FontWeight.bold),),
            Text("In ${checkLists[i].place}", style: const TextStyle(fontSize: 12),),
            const SizedBox(
              height: 15,
            ),
            Text("${checkLists[i].checkListDate}", style: const TextStyle(fontSize: 12),),
          ],
        ),
      );
    }
  }

  void changeCheckBox(value, index){
    checkLists[index].isChecked = value ;
    notifyListeners();
  } 

  void deleteCheck(i){
    checkLists.removeAt(i);
    notifyListeners();
  }
}
