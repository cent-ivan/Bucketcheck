import 'package:bucketcheck/Db/database.dart';
import 'package:flutter/material.dart';

class CompletedViewModel extends ChangeNotifier{
  //Initialize database
  LocalDatabase db = LocalDatabase();

  CompletedViewModel(){
    db.loadCompleteData();
    notifyListeners();
  }


  Widget displayCompleted(i){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
      child: Row(
        children: [
          
          Expanded(
            flex: 0,
            child: Checkbox(
              activeColor: const Color.fromRGBO(139, 203, 176,1),
              value: db.completedLists[i].isChecked,
              onChanged: (value) => (),
              ),
            ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${db.completedLists[i].checkListName}", style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough, fontSize: 18),),
                Text("${db.completedLists[i].place}", style: const TextStyle(fontSize: 12),),
                const SizedBox(
                  height: 15,
                ),
                Text("${db.completedLists[i].checkListDate}", style: const TextStyle(fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void deleteCheck(i){
    db.completedLists.removeAt(i);
    db.updateCompleteData();
    notifyListeners();
    
  }

  void clearAll(){
    db.completedLists.clear();
    db.updateCompleteData();
    notifyListeners();
  }
} 