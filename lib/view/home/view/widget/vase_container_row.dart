import 'package:flutter/material.dart';
import 'package:project_adi/core/extension/context_extension.dart';

class VaseContainerRow extends StatefulWidget {
  // ignore: use_super_parameters
  const VaseContainerRow({Key? key, required this.x, required this.y, required this.z}) : super(key: key);
  final double x;
  final double y;
  final double z;

  @override
  State<VaseContainerRow> createState() => _VaseContainerRowState();
}

class _VaseContainerRowState extends State<VaseContainerRow> {
  late double currentX;
  late double currentY;
  late double currentZ;

  @override
  void initState() {
    currentX = widget.x;
    currentY = widget.y;
    currentZ = widget.z;
    super.initState();
  }

  @override
  void didUpdateWidget(VaseContainerRow oldWidget) {
    if (oldWidget.x != widget.x) {
      setState(() {
        currentX = widget.x;
      });
    }
    if (oldWidget.y != widget.y) {
      setState(() {
        currentY = widget.y;
      });
    }
    if (oldWidget.z != widget.z) {
      setState(() {
        currentZ = widget.z;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildVaseContainer(buildAxis("X", Colors.red, context), currentX, Colors.white, context),
        buildVaseContainer(buildAxis("Y", Colors.blue, context), currentY, Colors.white, context),
        buildVaseContainer(buildAxis("Z", Colors.green, context), currentZ, Colors.white, context),
      ],
    );
  }
Widget buildVaseContainer(Widget buildAxis, double value, Color color, BuildContext context) {
  return Column(
    children: [buildColorContainer(context, color, buildAxis, value)],
  );
}

Widget buildColorContainer(BuildContext context, Color color, Widget axis, double value) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Container(
        height: context.dymaicHeight(0.085),
        width: context.dymaicWidth(0.21),
        decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 42, 105), borderRadius: BorderRadius.circular(15)),
      ),
      Container(
        width: context.dymaicWidth(0.20),
        height: context.dymaicHeight(0.08),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
        child: buildColorContainerTxt(axis, value, context),
      ),
      //buildBottom(),
    ],
  );
}

Widget buildColorContainerTxt(Widget axis, double value, BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        axis,
        Text(
          value.toStringAsFixed(2),
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.normal, fontSize: 16),
        ),
      ],
    ),
  );
}

Widget buildBottom() {
  return const SizedBox(
    width: 80,
    height: 10,
    child: Divider(color: Colors.black87, height: 5, thickness: 3),
  );
}

Widget buildAxis(String data, Color colorss, BuildContext context) {
  return Text(
    data,
    style: TextStyle(color: colorss),
  );
}
}
