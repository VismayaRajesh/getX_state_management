import 'package:get/get.dart';

class Countcntrl extends GetxController{
  var count = 0.obs; //obs - to dynamically change the value of the variable.

  void increment(){
    count ++;
    update();
  }
}