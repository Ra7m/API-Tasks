import 'package:category/feature/category/view/widget/card_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Column(
        children: [
          SizedBox(
            width: 50,
          ),
          CardWidget(endPoint: "electronics", icon: "💻", text: "electronics"),
          SizedBox(
            width: 50,
          ),
          CardWidget(endPoint: "jewelery", icon: "💍", text: "jewelery"),
          SizedBox(
            width: 50,
          ),
          CardWidget(
              endPoint: "men's%20clothing", icon: "👔", text: "mens clothes"),
          SizedBox(
            width: 50,
          ),
          CardWidget(
              endPoint: "women's%20clothing",
              icon: "👜",
              text: "women clothes"),
        ],
      ),
    );
  }
}
