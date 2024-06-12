import 'package:alitqaan/core/services/firestore_services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../core/screen_size/mediaQuery.dart';
import 'announcement_shimmer_loading.dart';

class BuildAnnouncement extends StatefulWidget {
  const BuildAnnouncement({
    super.key,
  });

  @override
  State<BuildAnnouncement> createState() => _BuildAnnouncementState();
}

class _BuildAnnouncementState extends State<BuildAnnouncement> {
  final ScrollController _scrollController = ScrollController();
  final FireStoreServices fireStoreServices = FireStoreServices();

  int itemCount = 4;
  RxInt currentPosition = 0.obs;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Get the scroll offset
    double offset = _scrollController.position.pixels;

    double itemWidth = MediaQuery.of(context).size.width - 30;
    currentPosition.value = (offset / itemWidth).round();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fireStoreServices.getAnnouncementImages(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          List<String> images = snapshot.data!;
          return SizedBox(
            width: getWidth(context) - 30,
            height: getHeight(context) / 4 + 28,
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: const PageScrollPhysics(),
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: getWidth(context) - 35,
                        height: getHeight(context) / 5,
                        decoration: BoxDecoration(
                            //color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(16),
                            // border: Border.all(color:Theme.of(context).colorScheme.primary)

                      ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16) ,
                          child: CachedNetworkImage(
                            imageUrl: images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return const Gap(5);
                  },
                  ),
                ),
                const Gap(10),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(itemCount, (index) {
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          child: SizedBox(
                            child: AnimatedContainer(
                              width: currentPosition.value == index
                                  ? 19.64
                                  : 9.82,
                              height: 6,
                              duration: const Duration(milliseconds: 500),
                              decoration: BoxDecoration(
                                color: currentPosition.value == index
                                    ? Theme.of(context).colorScheme.secondary
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const Gap(30),
              ],
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.0, horizontal: 0),
              child: announcementShimmerLoading(
                  getHeight(context) / 4, getWidth(context) - 30));
        }
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 0),
            child: announcementShimmerLoading(
                getHeight(context) / 4, getWidth(context) - 30),
          );
        }
      },
    );
  }
}
