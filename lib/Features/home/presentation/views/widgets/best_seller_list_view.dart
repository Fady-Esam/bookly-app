import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'best_seller_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).push('/bookDetailsView'),
          child: const BestSellerItem(),
        );
      },
    );
  }
}
