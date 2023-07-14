import 'package:capitals_app/database/database_helper.dart';
import 'package:capitals_app/moduls/words.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  void update(){
    notifyListeners();
  }
final List<Words>words=[];
initList({String? word})async{
  words.clear();
  if(word==null){
    words.addAll(await DatabaseHelper.instance.getWords());
    
  }else{
    words.addAll(await DatabaseHelper.instance.getWordsLike(word));
  }
  notifyListeners();
}

}