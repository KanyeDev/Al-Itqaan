

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utility/skeleton.dart';

Shimmer announcementShimmerLoading(double height, double width){
  return  Shimmer.fromColors(baseColor: Colors.grey[500]!, highlightColor: Colors.grey[100]!, child:  Skeleton(
    height: height,
    width: width,
    radius: 12.49,
  ));
}
