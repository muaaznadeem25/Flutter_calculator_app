import 'package:flutter/material.dart';

class My_btn extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress ;

  const My_btn({Key? key, required this.title, this.color = const Color(0xff343434), required this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
          onTap: onPress ,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
