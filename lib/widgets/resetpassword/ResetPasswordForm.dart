import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/widgets/shared/CustomTextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          width: 350,
          height: 500,
          decoration: BoxDecoration(
            color: AppColors.MIDNIGHTGREEN,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.WHITE,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(



              ),
            ),
          )),
    );
  }
}
