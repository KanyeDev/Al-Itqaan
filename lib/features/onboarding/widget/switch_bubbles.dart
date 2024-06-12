import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PageBubbleSwitch extends StatelessWidget {
  PageBubbleSwitch({super.key, this.index = 0, required this.currentIndex});

  int index;
  RxInt currentIndex;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
        width: currentIndex.value == index ? 36 : 18,
        height: 10,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: currentIndex.value == index
                ? (currentIndex.value == 0
                ? Theme.of(context).colorScheme.secondary
                : currentIndex.value == 1
                ? (Theme.of(context).colorScheme.primary)
                : currentIndex.value == 2
                ? (Theme.of(context).colorScheme.surface)
                : Colors.grey)
                : Colors.grey)));
  }
}