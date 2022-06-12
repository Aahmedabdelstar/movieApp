import 'package:flutter/material.dart';
import 'package:movie_app/data_screen/home_page_screen/widgets/popular_person_card.dart';
import 'package:movie_app/providers/main_provider.dart';
import 'package:pmvvm/pmvvm.dart';
import '../../utils/navigators.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/loading_card_list.dart';
import '../person_details_screen/person_details_view.dart';
import 'home_view_model.dart';



class HomePageView extends StatelessWidget {
  static const String routeName = "/HomePageView";

  const HomePageView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: () => const _HomeView(),
      viewModel: HomeViewModel(),
    );
  }

}

class _HomeView extends StatelessView<HomeViewModel> {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);



    return Scaffold(
      key: viewModel.scaffoldKey,
      appBar: const CustomAppBar(
        title: "Home",
        elevation: 1,
        leadingIcon: Icon(Icons.menu,color: Colors.black,),
      ),
      body: viewModel.isLoading
          ? const LoadingCardAnimations(
        listCount: 4,
      )
          : GridView.builder(
            itemCount: viewModel.popularPeopleList.length,
            padding: const EdgeInsets.only(
                bottom: 20,
                left: 8,
                right: 8,
                top: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return PopularPersonCard(
                image: viewModel.popularPeopleList[index].profilePath ?? '',
                name: viewModel.popularPeopleList[index].name,

                cardOnTap: () {
                  pushNamedRoute(context, PersonDetailsView.routeName,arguments: viewModel.popularPeopleList[index]);
                },

              );
            },
          ),
    );
  }
}
