import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personalizado/widgets/custom_button_widget.dart';
import 'package:http/http.dart' as http;

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  ValueNotifier<List<Post>> posts  = ValueNotifier<List<Post>>([]);

  callAPT() async {
    var client = http.Client();
    try {
      var response = await client.get
      (Uri.parse('https://jsonplaceholder.typicode.com/posts')
      );

      var decodedResponse = jsonDecode(response.body) as List;
      
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList()  ;
      
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<List<Post>>(
                  valueListenable: posts ,
                  builder: (_, valor, __) => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: valor.length,
                    itemBuilder: (_, idx) => ListTile(title: Text(valor[idx].title)
                    ),
                  )
                      ),
              const SizedBox(
                height: 10,
              ),
              CustomButtomWidget(
                disable: false,
                onPressed: () => callAPT(),
                title: "CustomButtom",
                titleSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Post { 
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map json) {
      return Post(json["userId"],json["id"],json["title"],json["body"]);
  }
  @override
  String toString() {
    return "id: $id";
  }
}

