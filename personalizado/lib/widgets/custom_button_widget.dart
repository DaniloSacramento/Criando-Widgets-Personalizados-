// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final bool disable;
  final double? titleSize;


  const CustomButtomWidget({      // MEU CONSTRUTOR
    Key? key,
    required this.onPressed,
    required this.title,
    required this.disable, 
    this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if(states.contains(MaterialState.disabled)) return Colors.red;
          if(states.contains(MaterialState.pressed)) return Colors.blue;
          return Colors.green;
        }),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
        ),
        textStyle: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)) return TextStyle(fontSize: titleSize != null ? titleSize! * 2 : 28);
          return TextStyle(fontSize: titleSize);
        })
      ),
    );
  }
}
