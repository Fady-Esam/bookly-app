import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_action_button.dart';
import '../../domain/entities/book_entity.dart';
import 'widgets/custom_best_seller_rating.dart';
import 'widgets/custom_book_details_app_bar.dart';
import 'widgets/custom_book_item.dart';

class BookPressedViewBody extends StatelessWidget {
  const BookPressedViewBody({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(height: 4),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: CustomBookItem(
                    bookEntity: bookEntity,
                  ),
                ),
                Text(
                  bookEntity.title ?? "",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  bookEntity.authorName ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 10),
                const CutsomBestSellerRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomActionButton(
                    onTap: () async {
                      if (bookEntity.previewLink == null) {
                        return;
                      }
                      var url = Uri.parse(bookEntity.previewLink!);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
