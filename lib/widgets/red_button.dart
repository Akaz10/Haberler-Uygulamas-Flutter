import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  String title;
  Function onClick;
  RedButton({required this.title,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
      child: InkWell(
        onTap: () => onClick(),
        child: Container(
          width: 320,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}