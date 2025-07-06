import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChange});
  final ValueChanged<bool> onChange;
  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'هل هذا العنصر مميز؟',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.lightPrimaryColor,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        Expanded(child: SizedBox(width: 16)),
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChange(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
