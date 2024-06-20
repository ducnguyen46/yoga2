import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoga/constants/app_color.dart';
import 'package:yoga/modules/dashboard/cubit/home_cubit.dart';
import 'package:yoga/modules/dashboard/widgets/yoga_categories_types.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.yoga_app,
                style: TextStyle(
                  fontFamily: 'Victoria',
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                  color: AppColor.purpleDecor,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.yoga_app_sologan,
                style: TextStyle(
                  fontFamily: 'GT',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColor.pupleBlue,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state.status == HomeStatus.loading ||
                state.status == HomeStatus.initial) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                ),
              );
            } else if (state.status == HomeStatus.loaded) {
              return ListView.builder(
                itemCount: state.categoriesByTypes.length,
                itemBuilder: (context, index) {
                  //truyen vao listCategory
                  return Container(
                    height: 310,
                    width: size.width,
                    margin: EdgeInsets.only(top: 40),
                    child: YogaCategoriesTypes(
                      listCategory:
                          state.categoriesByTypes.values.elementAt(index),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(AppLocalizations.of(context)!.error),
              );
            }
          }),
        ),
      ],
    );
  }
}
