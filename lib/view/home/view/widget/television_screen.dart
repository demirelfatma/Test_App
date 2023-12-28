import 'package:flutter/material.dart';
import 'package:project_adi/core/extension/context_extension.dart';

class TelevisionScreen extends StatelessWidget {
  final double x;
  final double y;
  final double z;
  const TelevisionScreen({super.key, required this.x, required this.y, required this.z});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const SizedBox(width: 30), buildScreenData(context), const SizedBox(width: 30)],
    );
  }

   Widget buildScreenData(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: const Color.fromARGB(255, 0, 42, 105),
            height: context.dymaicHeight(0.335),
            
          ),
          Container(
          padding: context.paddingLow,
          // height: 300,
          width: context.dymaicWidth(0.836),
          height: context.dymaicHeight(0.33),
          color: Colors.white,
          
        ),
        ],
      ),
    );
  }
}
