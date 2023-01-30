import 'package:get_storage/get_storage.dart';

class LocalData{
  final _box =GetStorage();

  void saveString (String key,String? value){
    _box.write(key, value);
  }
  String? getString (String key){
    return _box.read(key);
  }
  void clearAllData(){
    _box.erase();
  }
}