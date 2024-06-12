import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.value,
    required this.onTap,
  });

  final RxDouble value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                backgroundColor: Colors.grey,
                color: value.value == 0.5
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                value: value.value,
              )),
        ),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: 80,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Obx(
                () => CircleAvatar(
                    backgroundColor: value.value == 0.5
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).colorScheme.background,
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
