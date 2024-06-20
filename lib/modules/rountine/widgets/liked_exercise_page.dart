import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoga/modules/rountine/cubit/liked_exercise_cubit.dart';
import 'package:yoga/modules/rountine/widgets/yoga_category_card_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExerciseLikedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //
    return BlocBuilder<LikedExerciseCubit, LikedExerciseState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == LikedExerciseStatus.initial ||
            state.status == LikedExerciseStatus.loading) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 4.0,
            ),
          );
        } else {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 25,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.exercise_liked_by_you,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'GT',
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              BlocBuilder<LikedExerciseCubit, LikedExerciseState>(
                buildWhen: (previous, current) =>
                    previous.categories != current.categories,
                builder: (context, state) {
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridCal(size),
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                        childAspectRatio: 0.75,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return YogaCategoryCardGridView(
                            category: state.categories[index],
                          );
                        },
                        childCount: state.categories.length,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }

  int gridCal(Size size) {
    if (size.width < 250) {
      return 1;
    } else if (size.width < 500 && size.width > 250) {
      return 2;
    } else {
      return 3;
    }
  }
}
