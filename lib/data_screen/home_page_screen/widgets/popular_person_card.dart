import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/providers/main_provider.dart';
import 'package:movie_app/resource/assets_manager.dart';
import 'package:movie_app/resource/color_manager.dart';
import 'package:movie_app/resource/font_manager.dart';
import 'package:movie_app/utils/navigators.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../../utils/helpers_functions.dart';
import '../../../widgets/custom_text.dart';
import '../../person_details_screen/person_details_view.dart';



class PopularPersonCard extends StatelessWidget {
  final String? image;
  final int? toyId;
  final String? name;
  final Function()? cardOnTap;
  final bool? isSelected;




  const PopularPersonCard({Key? key, 
    this.toyId,
    this.image,
    this.name,
    this.isSelected=false,
    this.cardOnTap ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final helpProvider = Provider.of<MainProvider>(context, listen: true);

    return GestureDetector(
      onTap: cardOnTap ?? (){
        pushNamedRoute(context, PersonDetailsView.routeName);
      } ,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: widthOfScreen(context)*0.02,
            bottom: widthOfScreen(context)*0.01,
          ),
          width: widthOfScreen(context)*0.45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


              // toy image
              Expanded(
                child: GestureDetector(
                  child: Stack(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            imageUrl: "http://image.tmdb.org/t/p/w500$image",
                            // alignment: Alignment.center,
                            fit: BoxFit.fitWidth,
                            placeholder: (context, url) => Container(),
                            errorWidget: (context, url, error) => SizedBox(
                              child: Image.asset(ImageAssets.logoSplashScreen,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //divider
              Container(
                height: 1,
                margin: EdgeInsets.only(top: heightOfScreen(context) * 0.01),
                color: ColorManager.greyColor.withOpacity(0.5),
              ),

              //toy name
              Padding(
                padding: EdgeInsets.only(
                  left: widthOfScreen(context) * 0.035,
                  right: widthOfScreen(context) * 0.035,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 40,
                  alignment: Localizations.localeOf(context).languageCode == 'en' ?
                  Alignment.topLeft:Alignment.topRight,
                  child:
                  CustomText(
                    title: name,
                    size: FontSizeManager.s16,
                    textHeight: 1.4,
                    textOverflow: TextOverflow.ellipsis,
                  ),


                ),
              ),


              /// if with favourite button
              const Padding(
                padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                child: Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 25
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }


}
