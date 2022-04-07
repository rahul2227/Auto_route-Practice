import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomDetail extends StatelessWidget {
  const CustomDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dynamicSize = MediaQuery.of(context).size;
    return Container(
      width: dynamicSize.width,
      height: dynamicSize.height,
      color: Colors.cyanAccent,
      child: Center(
        child: IconButton(
          color: Colors.redAccent,
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 70.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
