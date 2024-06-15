import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoga/core/datasource/database_provider.dart';
import 'package:yoga/core/repositories/app_repository_imp.dart';
import 'package:yoga/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:yoga/modules/dashboard/cubit/home_cubit.dart';
import 'package:yoga/modules/progress/cubit/progress_cubit.dart';
import 'package:yoga/modules/rountine/cubit/liked_exercise_cubit.dart';
import 'package:yoga/modules/rountine/cubit/routine_exercise_cubit.dart';
import 'package:yoga/modules/splashscreen/screen/yoga_coming.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return RepositoryProvider(
      create: (context) =>
          AppRepositoryImp(dbProvider: DatabaseProvider.init()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LikedExerciseCubit(
              context.read<AppRepositoryImp>(),
            )..getLikedCategories(),
          ),
          BlocProvider(
            create: (context) => DashboardCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(
              appRepository: context.read<AppRepositoryImp>(),
            )..getCategories(),
          ),
          BlocProvider(
            create: (context) => RoutineExerciseCubit(
              context.read<AppRepositoryImp>(),
            )..getRoutineCategories(),
          ),
          BlocProvider(
            create: (context) => ProgressCubit(
              context.read<AppRepositoryImp>(),
            )..getInitalProgressData(),
          ),
        ],
        child: MaterialApp(
          title: 'Yoga',
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          home: YogaComing(),
        ),
      ),
    );
  }
}
