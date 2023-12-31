import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notee/core/network/http_ssl_pinning.dart';
import 'package:notee/core/routes/app_router.dart';
import 'package:notee/core/theme/theme.dart';
import 'package:notee/core/util/utils.dart';
import 'package:notee/feature/presentation/bloc/article_category_bloc/article_category_bloc.dart';
import 'package:notee/feature/presentation/bloc/article_detail_bloc/article_detail_bloc.dart';
import 'package:notee/feature/presentation/bloc/article_list_bloc/article_list_bloc.dart';
import 'package:notee/feature/presentation/bloc/bookmark_article_bloc/bookmark_article_bloc.dart';
import 'package:notee/feature/presentation/bloc/search_article_bloc/search_article_bloc.dart';
import 'package:notee/feature/presentation/pages/splash_page.dart';
import 'package:provider/provider.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<ArticleTopHeadlineListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArticleHeadlineBusinessListBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArticleCategoryBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchArticleBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<BookmarkArticleBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<ArticleDetailBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Headline News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: kWhiteColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: kColorScheme.copyWith(secondary: kPrimaryColor),
          bottomNavigationBarTheme: bottomNavigationBarTheme,
        ),
        home: const SplashPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
