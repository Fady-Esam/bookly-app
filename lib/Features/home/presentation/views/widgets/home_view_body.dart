import 'package:flutter/material.dart';
import '../../../../../core/utils/style.dart';
import 'best_seller_item.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 30),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const CustomBooksListView(),
                Text(
                  'Best Seller',
                  style: Style.titleMedium.copyWith(),
                ),
                const SizedBox(height: 25),
                const BestSellerItem(),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: BestSellerListView()),
        ],
      ),
    );
  }
}
