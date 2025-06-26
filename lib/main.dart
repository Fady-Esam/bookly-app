import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:new_bookly_app/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:new_bookly_app/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:new_bookly_app/core/utils/service_locator.dart';
import 'package:new_bookly_app/core/utils/simple_bloc_observer.dart';
import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  setUpServiceLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('featuredBooks');
  await Hive.openBox<BookEntity>('newestBooks');
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            fetchFeaturedBooksUseCase: getIt.get<FetchFeaturedBooksUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            fetchNewestdBooksUseCase: getIt.get<FetchNewestdBooksUseCase>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
