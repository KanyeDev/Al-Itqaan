import 'package:alitqaan/core/text_styles/text_styles.dart';
import 'package:alitqaan/core/utility/pageRoutes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../core/widget/customButton.dart';
import '../../class/page/class_room.dart';

class JoinClass extends StatelessWidget {
  const JoinClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          //App Bar
          Container(
            width: MediaQuery.of(context).size.width,
            height: 105,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 0, // Set spreadRadius to 0
                  offset: Offset(0, 4), // Adjust the offset as needed
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    FontAwesomeIcons.arrowLeftLong,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bold().boldHeader(5, "Tajweed Class 05",
                    Theme.of(context).colorScheme.secondary),
                const Gap(5),
                Row(
                  children: [
                    Regular().regularParagraph(
                        "s", "Class will be live on ", Colors.grey[700]!),
                    Regular().regularParagraph("s", " 10 April, 800-900 AM ",
                        Theme.of(context).colorScheme.secondary),
                  ],
                ),
                const Gap(30),
                Bold().boldParagraph("l", 'The teacher',
                    Theme.of(context).colorScheme.secondary),
                const Gap(10),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.onSurface),
                      child: Image.asset("asset/images/ustaadhPics.png"),
                    ),
                    const Gap(10),
                    Regular()
                        .regularParagraph('s', "Ustaadh Ahmad", Colors.black)
                  ],
                ),
                const Gap(30),
                Bold().boldParagraph("l", 'Class information',
                    Theme.of(context).colorScheme.secondary),
                const Gap(10),
                Regular().regularParagraph(
                    's',
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras et nunc in dolor ultricies efficitur vel at nulla. Fusce at sagittis turpis, in malesuada mauris. Vivamus eget augue non lorem elementum faucibus.",
                    Colors.grey[700]!),
                const Gap(30),
                Bold().boldParagraph("l", 'Study materials',
                    Theme.of(context).colorScheme.secondary),
                const Gap(15),
                Stack(
                  children: [
                    Container(
                      width: 96,
                      height: 123,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "https://th.bing.com/th?id=OIP.0XVPLAd-Hhmq79tSYCB8QgHaK6&w=205&h=303&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Container(
                          height: 24,
                          width: 23,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: const Center(
                              child: Icon(
                            FontAwesomeIcons.filePdf,
                            size: 16,
                          ))),
                    )
                  ],
                ),
              ],
            ),
          ),

          const Expanded(child: Gap(1)),

          CustomButton(
            color: Theme.of(context).colorScheme.primary,
            text: "Join Class",
            onTap: () => Navigator.push(
                context,
                CustomPageRouteLR(
                    child: const ClassRoom(), direction: AxisDirection.up)),
          ),

          const Gap(40),
        ],
      ),
    );
  }
}
