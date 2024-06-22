import 'package:bucketcheck/ViewModels/active_viewModel.dart';
import 'package:hive/hive.dart';

class LocalDatabase{
  //Active checklist
  List checkLists = [];
  
  final _bucketbox = Hive.box<List>('bucketbox');

  void loadActiveData(){
    checkLists = _bucketbox.get('ACTIVELIST')!;
  }

  void updateActiveData(){
    _bucketbox.put('ACTIVELIST', checkLists);
  }


//-----------------------------------------------------------------------------------
  //Hive title methods
  final _title = Hive.box('title'); //for storing title

  void getTitle(){
    if (ActiveViewModel.title.isEmpty){
      ActiveViewModel.title = _title.get('TITLE', defaultValue: "My Chechlist");
    } 
    
  }

  void changeTitle(String newTitle){
    _title.put('TITLE', newTitle);
  }
}