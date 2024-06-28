import 'package:flutter/material.dart';

class CardIndicator extends StatelessWidget {
  final Color? color1;
  final Color? color2;

  const CardIndicator({super.key, required this.color1, required this.color2});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 1),
      child: Row(
        children: [
          Container(
            width: 168,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color1,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 168,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color2,
            ),
          ),
        ],
      ),
    );
  }
}
