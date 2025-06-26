import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/book_pressed_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/manager/cubit/search_books_cubit.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/bookDetailsView',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookEntity: state.extra as BookEntity,
          ),
        ),
      ),
      GoRoute(
        path: '/searchView',
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<HomeRepoImpl>()),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: '/pressedView',
        builder: (context, state) => BookPressedView(
          bookEntity: state.extra as BookEntity,
        ),
      ),
    ],
  );
}
