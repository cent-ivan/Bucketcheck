import 'package:hive/hive.dart';

part 'check_list_model.g.dart';

@HiveType(typeId: 0)
class CheckList {
  @HiveField(0)
  String? checkListName;

  @HiveField(1)
  String? place;

  @HiveField(2)
  String? checkListDate;

  @HiveField(3)
  bool? isChecked;

  CheckList({this.checkListName, this.place, this.checkListDate, this.isChecked});
}
