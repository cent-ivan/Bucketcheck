import 'package:bucketcheck/Models/bucket_list_model.dart';
import 'package:flutter/material.dart';

class BucketListViewModel extends ChangeNotifier{

  BucketList bucketList = BucketList();
  List<BucketList> bucketLists = [
  ];


  Widget displayBucketList(i){ 
    return  Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${bucketLists[i].bucketListName}", style: const TextStyle(fontWeight: FontWeight.bold),),

            const SizedBox(
              height: 13,
            ),

            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  size: 15,
                ),
                Text("${bucketLists[i].date}", style: const TextStyle(fontSize: 12),),
              ],
            ),
            
            
            //Text("${bucketLists[i][2]}", style: const TextStyle(fontSize: 12),),
          ],
        ),
      );
  }

  void deleteBucket(i){
    bucketLists.removeAt(i);
    notifyListeners();
  }

  void addBucket(String? listName, DateTime date, ) {
    bucketLists.add(BucketList(bucketListName: listName, date: date));
    notifyListeners();
  }
}
