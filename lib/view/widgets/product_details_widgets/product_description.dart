import 'package:fashion_store/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      product.description,
      trimMode: TrimMode.Line,
      textAlign: TextAlign.justify,
      trimLines: 2,
      trimCollapsedText: 'Show more',
      trimExpandedText: '  Show less',
      style: GoogleFonts.pridi(),
      lessStyle: GoogleFonts.pridi(fontSize: 16, fontWeight: FontWeight.bold),
      moreStyle: GoogleFonts.pridi(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
