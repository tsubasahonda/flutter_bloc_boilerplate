import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/api/news_api.dart';
import 'package:flutter_bloc_boilerplate/data/news_repository.dart';
import 'package:flutter_bloc_boilerplate/values/app_colors.dart';
import 'package:http/http.dart';
import 'package:flutter_bloc_boilerplate/api/api_client.dart';
import 'package:flutter_bloc_boilerplate/view/main/main_navigation_page.dart';

class Application extends StatelessWidget {
  @override
  build(BuildContext context) {
    final ApiClient apiClient = ApiClient(Client());

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (_) => NewsRepository(DefaultNewsApi(apiClient)))
      ],
      child: MaterialApp(
        title: "Bolierplate",
        theme: ThemeData(
          primaryColor: AppColors.greenBase,
          accentColor: AppColors.greenBase,
          appBarTheme: AppBarTheme(color: Colors.white),
        ),
        home: MainNavigationPage(),
      ),
    );
  }
}
