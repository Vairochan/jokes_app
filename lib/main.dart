import 'package:flutter/material.dart';
import 'package:jokes_app_orientation/ui/master_detail_screen.dart';

void main(){
  runApp(MaterialApp(
    title: 'jokes',
    home: MasterDetailScreen(),
    theme: ThemeData(
      primarySwatch: Colors.orange
    ),
  ));
}
