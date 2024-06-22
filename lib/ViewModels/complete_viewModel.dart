import 'package:flutter/material.dart';

class CompletedViewModel extends ChangeNotifier{

  List completedLists = [];


  Widget displayCompleted(i){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
      child: Row(
        children: [
          
          Expanded(
            flex: 0,
            child: Checkbox(
              activeColor: const Color.fromRGBO(139, 203, 176,1),
              value: completedLists[i].isChecked,
              onChanged: (value) => (),
              ),
            ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${completedLists[i].checkListName}", style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough, fontSize: 18),),
                Text("${completedLists[i].place}", style: const TextStyle(fontSize: 12),),
                const SizedBox(
                  height: 15,
                ),
                Text("${completedLists[i].checkListDate}", style: const TextStyle(fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void deleteCheck(i){
    completedLists.removeAt(i);
    notifyListeners();
    
  }

  void clearAll(){
    completedLists.clear();
    notifyListeners();
  }
} 