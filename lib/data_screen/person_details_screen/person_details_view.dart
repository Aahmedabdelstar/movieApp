import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data_screen/person_details_screen/person_details_view_model.dart';
import 'package:movie_app/providers/main_provider.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../resource/assets_manager.dart';
import '../../resource/color_manager.dart';
import '../../resource/constants_manager.dart';
import '../../resource/end_points_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/values_manager.dart';
import '../../utils/helpers_functions.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/custom_text.dart';
import '../image_full_screen_.dart';

class PersonDetailsView extends StatelessWidget {
  static const String routeName = "/PersonDetailsView";

  const PersonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      viewModel: PersonDetailsViewModel(),
      view: () => const _PersonDetailsView(),
    );
  }
}

class _PersonDetailsView extends StatelessView<PersonDetailsViewModel> {
  const _PersonDetailsView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, PersonDetailsViewModel viewModel) {


    return Scaffold(
      appBar: const CustomAppBar(
        elevation: 1,
        title: "Person Profile",
        leadingIcon: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      backgroundColor: ColorManager.greyBackgroundColor,
      body: Column(
        children: [





          Expanded(
            child: ListView(
              children: [

                // helpProvider.selectedToy!.images!.length>1 ?
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay:true,
                    enlargeCenterPage: true,
                    height: heightOfScreen(context) * .45,
                    aspectRatio: 0.6,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {},
                  ),
                  items: viewModel.personImagesList.map(
                        (item) => InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return ImageFullScreen(
                                    imageUrl: '${EndPointsStrings.imageBaseUrlEndPoint}${item.filePath}',
                                  );
                                }));
                          },
                          child:  ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25)
                              ),


                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              imageUrl:  '${EndPointsStrings.imageBaseUrlEndPoint}${item.filePath}',
                              alignment: Alignment.center,
                              placeholder: (context, url) => Container(),
                              errorWidget: (context, url, error) => SizedBox(
                                width: widthOfScreen(context) * 0.23,
                                height: widthOfScreen(context) * 0.23,
                                child: Image.asset(
                                  ImageAssets.logoSplashScreen,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                  ).toList(),
                ),



                const SizedBox(height: 20,),

                // name person
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLeftAndRightScreen
                  ),
                  child: Row(
                    children: [

                      // name of toy
                      Expanded(
                        child: CustomText(
                          title: viewModel.personSelected?.name ?? '',
                          size: percentHeightAndWidthOfScreen(context) *
                              AppSize.s10,
                          maxLines: 2,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),


                    ],
                  ),
                ),

                divider(marginVertical: 10, marginHorizontal: 5),


                // name toy and age
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLeftAndRightScreen
                  ),
                  child: Row(
                    children: [

                      // name of toy
                      Expanded(
                        child: CustomText(
                          title: viewModel.personSelected?.gender == 2 ? 'Male' : 'Female' ,
                          size: percentHeightAndWidthOfScreen(context) *
                              AppSize.s10,
                          maxLines: 2,
                          fontWeight: FontWeightManager.medium,
                        ),
                      ),


                    ],
                  ),
                ),




              ],
            ),
          ),
        ],
      ),
    );
  }

  

}


