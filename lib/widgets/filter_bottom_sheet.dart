import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/typography/typography.dart';
import 'package:mrowid/widgets/custom_button.dart';
import 'package:mrowid/widgets/custom_input.dart';
import '../controllers/filter_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterController controller = Get.put(FilterController());

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              'assets/icons/bar.png',
              width: 40,
              height: 4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Text(
                  'Filter Cafes',
                  style: Font.bold.fs18.black2b(),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xFFE1D9D9),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Location',
                    style: Font.semiBold.fs12.black2b(),
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        height: 250,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount: controller.cities.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                controller.cities[index],
                                style: Font.regular.fs12.black2b(),
                              ),
                              onTap: () => controller.selectCity(controller.cities[index]),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: Obx(
                    () => Input(
                      hint: controller.selectedCity.value,
                      hintStyle: Font.regular.fs12.black2b(),
                      suffixWidget: Image.asset(
                        'assets/icons/arrow_down.png',
                        width: 20,
                        height: 20,
                      ),
                      readOnly: true,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Container(
            height: 1,
            color: const Color(0xFFE1D9D9),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 5),
                CustomButton(
                  text: 'Submit',
                  onPressed: controller.submitFilter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}