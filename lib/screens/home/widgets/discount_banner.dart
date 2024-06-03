import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../constant/AppColors.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.MIDNIGHTGREEN,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text:  AppLocalizations.of(context)!.discover,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  TextSpan(
                    text: "  "+ AppLocalizations.of(context)!.oferts,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
