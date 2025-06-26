import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_action_button.dart';
import 'widgets/custom_best_seller_rating.dart';
import 'widgets/custom_book_details_app_bar.dart';

class BookPressedViewBody extends StatelessWidget {
  const BookPressedViewBody({
    super.key,
  });

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
                  // child: const CustomBookItem(),
                ),
                const Text(
                  'Title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Title',
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
                    // bookModel: bookModel,
                    onTap: () async {
                      // var url = Uri.parse(bookModel.volumeInfo!.previewLink!);
                      // if (await canLaunchUrl(url)) {
                      //   await launchUrl(url);
                      // }
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
