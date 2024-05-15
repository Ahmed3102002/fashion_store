import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).scaffoldBackgroundColor;

    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            color: color,
          ),
        ),
        CustomTextWidget(
          text: ' Or ',
          fontSize: 20,
          color: color,
        ),
        Expanded(
          child: Divider(
            thickness: 2,
            color: color,
          ),
        ),
      ],
    );
  }
}
