import 'package:alitqaan/core/screen_size/mediaQuery.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/text_styles/text_styles.dart';

class ClassRoom extends StatefulWidget {
  const ClassRoom({super.key});

  @override
  State<ClassRoom> createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 50),
          child: Column(
            children: [
              Container(
                width: getWidth(context),
                height: getHeight(context) * 2 / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Theme.of(context).colorScheme.primary),
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: ()=> Navigator.pop(context),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Icon(
                            FontAwesomeIcons.arrowLeftLong,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Container(
                width: getWidth(context),
                height: getHeight(context) / 4.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200]!),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      Bold().boldParagraph("l", "Ustaadh Ahmad", Colors.black),
                      const Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 250,
                              child: Regular().regularParagraph(
                                  's',
                                  "The name of the book is Tuhfatul Atfaal",
                                  Colors.grey[700]!)),
                          Regular()
                              .regularParagraph('s', "8:10am", Colors.grey[500]!),
                        ],
                      ),
                      const Expanded(child: Gap(1)),
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Icon(
                              FontAwesomeIcons.paperclip,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const Gap(10),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: getWidth(context) * 2.1 / 3,
                            height: 44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: TextField(
                              controller: messageController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                  hintText: "Text Message...",
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
