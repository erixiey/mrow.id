import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';

class CustomPhoneInput extends StatelessWidget {
  final RxString countryCode;
  final void Function(String) updateCountryCode;
  final String label;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final TextEditingController? phoneController;

  const CustomPhoneInput({
    Key? key,
    required this.countryCode,
    required this.updateCountryCode,
    required this.label,
    this.hint,
    this.onChanged,
    this.phoneController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Font.semiBold.fs12.black2b(),
        ),
        const SizedBox(height: 8),
        Obx(
          () => Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: Text(
                        'Pilih Kode Negara',
                        style: Font.semiBold.fs16.black2b(),
                      ),
                      content: SizedBox(
                        width: double.minPositive,
                        child: ListView(
                          shrinkWrap: true,
                          children: ['+62', '+1', '+44', '+91']
                              .map((code) => ListTile(
                                    title: Text(
                                      code,
                                      style: Font.regular.fs14.black2b(),
                                    ),
                                    onTap: () {
                                      updateCountryCode(code);
                                      Get.back();
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 56.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: AppColors.grayf6,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                    border: Border.all(color: AppColors.grayd9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 4),
                      Text(
                        countryCode.value,
                        style: Font.regular.fs14.black2b(),
                      ),
                      const SizedBox(width: 5.0),
                      Image.asset(
                        'assets/icons/arrowdown_black.png',
                        width: 16.0,
                        height: 16.0,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: AppColors.whiteff,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    border: Border.all(color: AppColors.grayd9),
                  ),
                  child: TextField(
                    onChanged: onChanged,
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: hint != null
                          ? Font.regular.fs12.gray94()
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    ),
                    keyboardType: TextInputType.phone,
                    style: Font.regular.fs12.black2b(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}