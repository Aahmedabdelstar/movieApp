import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../resource/constants_manager.dart';
import '../utils/helpers_functions.dart';

class LoadingCardAnimations extends StatelessWidget {
  final int? listCount;

  const LoadingCardAnimations({Key? key, this.listCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listCount,
      padding: const EdgeInsets.only(
          bottom: 20,
          left: AppConstants.paddingLeftAndRightScreen / 2,
          right: AppConstants.paddingLeftAndRightScreen / 2,
          top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 0,
          mainAxisSpacing: 3,
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingLeftAndRightScreen / 2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.only(
              top: widthOfScreen(context) * 0.02,
              bottom: widthOfScreen(context) * 0.01,
            ),
            width: widthOfScreen(context) * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // toy image
                Expanded(
                  child: GestureDetector(
                    child: Opacity(
                      opacity: AppConstants.moreOpacityValue,
                      child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: double.infinity,
                          minHeight: MediaQuery.of(context).size.height / 8,
                          maxHeight: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //divider
                Container(
                  height: 1,
                  margin: EdgeInsets.only(top: heightOfScreen(context) * 0.01),
                  color: Colors.grey.withOpacity(AppConstants.moreOpacityValue),
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Opacity(
                    opacity: AppConstants.moreOpacityValue,
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: widthOfScreen(context) * .4,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Opacity(
                    opacity: AppConstants.moreOpacityValue,
                    child: SkeletonLine(
                      style: SkeletonLineStyle(
                          height: 16,
                          width: widthOfScreen(context) * .4,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child:
                      Icon(Icons.favorite_border, color: Colors.grey, size: 25),
                ),

                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
        // return const Skeleton();
      },
    );
  }
}
