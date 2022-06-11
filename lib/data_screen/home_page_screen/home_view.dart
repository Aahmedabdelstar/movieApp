import 'package:flutter/material.dart';
import 'package:movie_app/providers/main_provider.dart';
import 'package:pmvvm/pmvvm.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/toys_loading_card_list.dart';
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
    final helpProvider = Provider.of<MainProvider>(context, listen: true);


    return Scaffold(
      key: viewModel.scaffoldKey,
      appBar: const CustomAppBar(
        title: "Home",

      ),
      body: viewModel.isLoading
          ? const ToysLoadingCardAnimations(
        listCount: 4,
      )
          : SingleChildScrollView(
        child: Column(
          children: [

            /// category
            ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 15),
              shrinkWrap: true,
              itemBuilder: (context, item) {
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
