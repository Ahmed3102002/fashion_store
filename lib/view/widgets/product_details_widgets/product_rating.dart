import 'package:fashion_store/model/product_model.dart';
import 'package:fashion_store/view/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: product.rating.rate.toString(),
        ),
        RatingBar(
          initialRating: product.rating.rate,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: product.rating.rate.round(),
          ratingWidget: RatingWidget(
            full: Icon(
              Icons.star,
              color: Colors.amber,
              size: MediaQuery.sizeOf(context).width * 0.05,
            ),
            half: Icon(
              Icons.star,
              color: Colors.amber,
              size: MediaQuery.sizeOf(context).width * 0.05,
            ),
            empty: Icon(
              Icons.star_border_outlined,
              color: Colors.grey,
              size: MediaQuery.sizeOf(context).width * 0.05,
            ),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
