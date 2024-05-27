import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacroWidget extends StatelessWidget {
  late final String title;
  final int value;
  final IconData icon;
  MyMacroWidget({
    required this.value,
    required this.icon,
    required this.title,super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child:Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const[
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 5
                )
              ]
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                FaIcon(
                icon,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  title== "Calories"
                      ? '$value $title'
                       :  '${value}g $title',
                  style: const TextStyle(fontSize: 10),
                ),
          ],
        ),
          ),
        )
    );
  }
}









