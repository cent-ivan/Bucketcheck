import 'package:bucketcheck/ViewModels/active_viewModel.dart';
import 'package:hive/hive.dart';

class LocalDatabase{
  List checkLists = [];

  final _title = Hive.box('title'); //for storing title
  
  final _bucketbox = Hive.box<List>('bucketbox');

  void loadData(){
    checkLists = _bucketbox.get('ACTIVELIST')!;
  }

  void updateData(){
    _bucketbox.put('ACTIVELIST', checkLists);
  }


  //Hive title methods
  void getTitle(){
    if (ActiveViewModel.title.isEmpty){
      ActiveViewModel.title = _title.get('TITLE', defaultValue: "My Chechlist");
    } 
    
  }

  void changeTitle(String newTitle){
    _title.put('TITLE', newTitle);
  }
}