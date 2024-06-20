import 'package:bucketcheck/ViewModels/complete_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:bucketcheck/Models/check_list_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ActiveViewModel extends ChangeNotifier{
  //list of checklists
   List<CheckList> checkLists = [];

  //Text filed controllers
  final _controller = TextEditingController(); //controller of title
  final _addCheckController = TextEditingController(); //controller of checklist name
  final _addPlaceController = TextEditingController(); //controller of add place

  String title = "My Checklists"; //default checklist title

  String checkListName = "";
  String place = "";

  //time picker object
  TimeOfDay time = const TimeOfDay(hour: 0, minute: 0); //default time


  //----------Widgets-----------------------------------------------------

  Widget displayCheckList(i, context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
      child: Row(
        children: [
          //checkbox widget
          Expanded(
            flex: 0,
            child: Checkbox(
              activeColor: const Color.fromRGBO(139, 203, 176,1),
              value: checkLists[i].isChecked,
              onChanged: (value) => changeCheckBox(value, i, context),
              ),
            ),

          //Texts to display in the checklist tile
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 8, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${checkLists[i].checkListName}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  Text("${checkLists[i].place}", style: const TextStyle(fontSize: 12,),),
              
                  const SizedBox(
                    height: 15,
                  ),
              
                  Text("${checkLists[i].checkListDate}", style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

   //changing the value of the checkbox
  void changeCheckBox(value, i, BuildContext context){
    checkLists[i].isChecked = value ;

    final completed = context.read<CompletedViewModel>(); //remember this to record changes in other classes
    completed.completedLists.add(CheckList(checkListName: checkLists[i].checkListName, place: checkLists[i].place, checkListDate: checkLists[i].checkListDate, isChecked: checkLists[i].isChecked));
    deleteCheck(i);
    notifyListeners();
  } 




  //Time Picker Widget----
  void timePickerWidget(context) async {
    final pickedTime = await showTimePicker(
      context: context, 
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.input
    );

    //For cancle button to avoid crashing
    if (pickedTime != null) {
      changeTime(pickedTime);
    }
  }

  void changeTime(TimeOfDay value){
    time = value;
    notifyListeners();
  }


  //Add item to checklist----
  void addCheckList(context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Consumer<ActiveViewModel>(builder: (context, activeValue, child) => AlertDialog(
          backgroundColor:Colors.white,
          content:  Container(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //enter checklist title
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLength: 20,
                    controller: _addCheckController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add Checklist",
                    ),
                  ),
                  
                  const SizedBox(height: 15,),

                  //enter place
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: 15,
                    controller: _addPlaceController,
                    decoration: const InputDecoration(
                      hintText: "Enter place"
                    ),
                  ),

                  //pick time
                  Row(
                    children: [
                      //show the time that the user input
                      Expanded(child: Text(time.format(context).toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                      MaterialButton(
                        elevation: 1,
                        color: const Color.fromARGB(255, 129, 209, 177),
                        onPressed: () => (timePickerWidget(context)),
                        child: const Text("Pick Time"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15,),

                  const Divider(
                    height: 10,
                    color: Colors.black,
                  ),

                  //save and cancel buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        elevation: 1,
                        color: const Color.fromARGB(255, 129, 209, 177),
                        onPressed: () => (saveCheck(context)),
                        child: const Text("Add"),
                      ),

                      const SizedBox(width: 4,),

                      MaterialButton(
                        elevation: 1,
                        color: Colors.redAccent,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      );
      }
    ); 
  }

  //initializes variables
  void saveCheck(context){
    checkListName = _addCheckController.text;
    if (_addPlaceController.text == ""){
      place = "No Place Added";
    }
    else{
      place = "In ${_addPlaceController.text}";
    }
    
    _addCheckController.clear();
    _addPlaceController.clear();

    addCheck(context);
    notifyListeners();
  }


  // Add checklist save (adding to list)
  void addCheck(BuildContext context) {
    if (checkListName.isEmpty) {
      warningDialog(context);
      return;
    }
    else{
      checkLists.add(CheckList(
        checkListName: checkListName,
        place: place,
        checkListDate: time.format(context).toString(),
        isChecked: false)
      );
    }
    
    //automatically sort base on time
    sortByTime(checkLists);
    time = const TimeOfDay(hour: 0, minute: 0);
    notifyListeners();
    Navigator.of(context).pop();
}

  //converting string to TimeOfday
  TimeOfDay parseTimeOfDay(String timeString) {
    final format = DateFormat.jm(); // Use the intl package for parsing
    final dateTime = format.parse(timeString);
    return TimeOfDay.fromDateTime(dateTime);
  }

  //sorting time
  void sortByTime(List<CheckList> checkLists) {
  checkLists.sort((a, b) {
    TimeOfDay aTime = parseTimeOfDay(a.checkListDate!);
    TimeOfDay bTime = parseTimeOfDay(b.checkListDate!);
    return aTime.hour.compareTo(bTime.hour) != 0
        ? aTime.hour.compareTo(bTime.hour)
        : aTime.minute.compareTo(bTime.minute);
  });
}




  //Change checklist title dialog-----
  void changeTitle(context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: 155,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //enter title
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    maxLength: 25,
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Title of the checklist"
                    ),
                  ),
              
                  //save and cancel buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        color: const Color.fromARGB(255, 83, 142, 118),
                        onPressed: () => (onSave(context)),
                        child: const Text("Save"),
                      ),

                      const SizedBox(width: 4,),

                      MaterialButton(
                        color: Colors.redAccent,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  //save method for dialog buttons
  void onSave(context){
    title = _controller.text;
    notifyListeners();
    Navigator.of(context).pop();
  }
  
  void deleteCheck(i){
    checkLists.removeAt(i);
    notifyListeners();
  }





  //warning dialog
  void warningDialog(context){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text("No entered name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          backgroundColor: Colors.white,
          content: Container(
            height: 155,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  const Expanded(child: Text("Checklist must have a name.\nPlease try again.", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        color: const Color.fromARGB(255, 83, 142, 118),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Ok"),
                      ),
                    ],
                  )
                ],
              ),
            )
          )
        );
      }
    );

  }


}
