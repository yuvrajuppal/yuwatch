import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class fulldataprovider extends ChangeNotifier{

  
 
  
  List<String> favid=[];
  List<String> favlinks=[];



  int allmovieswebslength=0;

  void emptyinfo(){ 
   favid=[];
   favlinks=[];
  }

}