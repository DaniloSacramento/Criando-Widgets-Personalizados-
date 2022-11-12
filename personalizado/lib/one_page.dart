import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personalizado/widgets/custom_button_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {

  ValueNotifier<int> valorAleatorio = ValueNotifier<int> (0);

  random() async{
      for(int i = 0; i < 10; i++ ){ 
        await Future.delayed(Duration(seconds: 1));
         
           valorAleatorio.value = Random().nextInt(1000);
     
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(valueListenable: valorAleatorio, builder: (_, valor, __) => Text(
            "Valor eh : $valor",
            style: const TextStyle(fontSize: 20),)
            ),
          const SizedBox(height: 10,),
            CustomButtomWidget(
              disable: false,
              onPressed: () => random(), 
              title: "CustomButtom",
              titleSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}