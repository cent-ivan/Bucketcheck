import 'package:bucketcheck/ViewModels/active_viewModel.dart';
import 'package:hive/hive.dart';

class LocalDatabase{
  //Active checklist storage
  List checkLists = [];
  
  final _bucketbox = Hive.box<List>('bucketbox');

  void loadActiveData(){
    //checkLists = _bucketbox.get('ACTIVELIST')!;
    var activeList = _bucketbox.get('ACTIVELIST');
    if (activeList != null) {
      checkLists = activeList;
    } else {
      _bucketbox.put('ACTIVELIST', checkLists);
      activeList = _bucketbox.get('ACTIVELIST');
      checkLists = activeList!;
    }
  }

  void updateActiveData(){
    _bucketbox.put('ACTIVELIST', checkLists);
  }


  //Complete checklist storage
  List completedLists = [];

  final _completetbox = Hive.box<List>('completebox');

  void loadCompleteData() {
    //completedLists =  _completetbox.get('COMPLETELIST')!;
    var completeList = _completetbox.get('COMPLETELIST');
    if (completeList != null) {
      completedLists = completeList;
    } else {
      //if initial open added default list
      _bucketbox.put('ACTIVELIST', checkLists);
      completeList = _bucketbox.get('ACTIVELIST');
      checkLists = completeList!;
    }
  }

  void updateCompleteData(){
    _completetbox.put('COMPLETELIST', completedLists);
  }

//-----------------------------------------------------------------------------------
  //Hive title methods
  final _title = Hive.box('title'); //for storing title

  void getTitle(){
    if (ActiveViewModel.title.isEmpty){
      ActiveViewModel.title = _title.get('TITLE', defaultValue: "My Checklist");
    } 
    
  }

  void changeTitle(String newTitle){
    _title.put('TITLE', newTitle);
  }
}