
import 'package:flutter/material.dart';
import 'custom_best_seller_rating.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      padding: const EdgeInsets.only(bottom: 15),
      height: 180,
      child: GestureDetector(
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.32 / 2,
              // child: CachedNetworkImage(
              //   errorWidget: (context, url, error) => const Center(
              //     child: Icon(Icons.error),
              //   ),
              //   imageUrl: ,
              //   fit: BoxFit.fill,
              //   placeholder: (context, url) => const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
              child: Image.asset('assets/images/test_image.png'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'GT Sectra Fine',
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Row(
                    children: [
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Spacer(),
                      CutsomBestSellerRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
