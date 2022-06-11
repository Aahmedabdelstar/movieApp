import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data_screen/person_details_screen/person_details_view_model.dart';
import 'package:movie_app/providers/main_provider.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../resource/assets_manager.dart';
import '../../resource/color_manager.dart';
import '../../resource/constants_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/values_manager.dart';
import '../../utils/helpers_functions.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/custom_text.dart';

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
    final helpProvider = Provider.of<MainProvider>(context, listen: true);


    return Scaffold(
      appBar: const CustomAppBar(
        elevation: 1,
        actionIcons: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingLeftAndRightScreen),
            child: Icon(Icons.more_vert,size: AppConstants.appBarIconSize,),
          )
        ],
      ),
      backgroundColor: ColorManager.greyBackgroundColor,
      body: Column(
        children: [




          Expanded(
            child: ListView(
              children: [

                // helpProvider.selectedToy!.images!.length>1 ?
                ClipRRect(
                  borderRadius:
                  const BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  child: SizedBox(
                    width: widthOfScreen(context),
                    height: 400,
                    child: Stack(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.personImagesList.length,
                          itemBuilder: (context,index){
                            return  CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover,
                              imageUrl:  viewModel.personImagesList[index].filePath ?? '',
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
                            );
                          },
                        ),


                        Positioned(
                          bottom: 15,
                          left: 30,
                          right: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [



                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  children: _buildPageIndicator(context,viewModel),
                                ),
                              ),







                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                ),







                const SizedBox(height: 20,),

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
                          title: helpProvider.selectedPersonModel!.name ?? '',
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





              ],
            ),
          ),





        ],
      ),
    );
  }


  List<Widget> _buildPageIndicator(
      BuildContext context, PersonDetailsViewModel viewModel) {
    final pageDataProvider = Provider.of<MainProvider>(context, listen: true);

    List<Widget> list = [];
    for (int i = 0; i < viewModel.personImagesList.length; i++) {
      list.add(
          i == viewModel.selectedImageIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration.zero,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? ColorManager.primaryColor : ColorManager.greyColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }




}


