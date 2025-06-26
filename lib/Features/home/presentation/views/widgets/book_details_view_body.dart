import 'package:flutter/material.dart';
import 'package:new_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_action_button.dart';
import 'custom_best_seller_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_item.dart';
import 'similar_books_list_view.dart';

class BookDtailsViewBody extends StatelessWidget {
  const BookDtailsViewBody({super.key, required this.bookEntity});

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
                  bookEntity.title ??"",
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
                      if(bookEntity.previewLink == null){
                        return;
                      }
                      var url = Uri.parse(bookEntity.previewLink!);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Text(
                        'You can also like',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const SimilarBooksListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
