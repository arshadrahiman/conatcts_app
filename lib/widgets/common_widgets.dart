import 'package:flutter/material.dart';
import 'package:task_app/res/colors.dart';
import 'package:task_app/res/style.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Color? buttonColor;
  final Color? textColor;
  CustomButton({
    required this.label,
    required this.textColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: buttonColor ?? AppColors.green,
      ),
      child: Center(
        child: Text(
          label ?? "",
          style: customStyle(20.0, textColor, FontWeight.w500),
        ),
      ),
    );
  }
}

class DetailsWidg extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon icontype;
  const DetailsWidg({
    required this.title,
    required this.subTitle,
    required this.icontype,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icontype,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: customStyle(15.0, const Color.fromARGB(173, 104, 101, 101),
                FontWeight.normal),
          ),
          Text(
            subTitle,
            style: customStyle(
                15.0, const Color.fromARGB(172, 35, 35, 35), FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
