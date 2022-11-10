import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personalizado/widgets/custom_button_widget.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButtomWidget(
          disable: false,
          onPressed: (){}, 
          title: "CustomButtom",
          titleSize: 20,
        ),
      ),
    );
  }
}