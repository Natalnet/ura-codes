import 'package:flutter/material.dart';
import 'package:view_example/component_example.dart';
import 'package:view_example/view_example.dart';

class ComponentModel {
  ComponentExample example;
  bool visible = true;
  ComponentModel(this.example);

  Map<String, Widget> widgets() {
    return example.examples();
  }

  static List<ComponentModel> get buttons {
    return [
      ComponentModel(ButtonCircularExamples()),
      ComponentModel(JoyStickExamples()),
    ];
  }
}
