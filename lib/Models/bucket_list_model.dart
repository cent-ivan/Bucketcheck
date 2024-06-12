class BucketList {
  String? bucketListName;
  DateTime? date;
  int? _progress;
  int? numberCheckLists;

  BucketList({this.bucketListName, this.date});
  
  set progress(int progress) => _progress = progress;
  String get formatProgress => "$_progress / $numberCheckLists";
}