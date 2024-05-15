import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsImage extends StatelessWidget {
  ProductDetailsImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).dividerColor;
    final controller = Get.find<ProductsController>();
    return Stack(children: [
      CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        options: CarouselOptions(
          onPageChanged: (index, reason) =>
              controller.setCurrentImageIndex(index: index),
          viewportFraction: 1,
          height: MediaQuery.sizeOf(context).width * 0.9,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
      Positioned(
        bottom: 0.5,
        left: 180,
        child: AnimatedSmoothIndicator(
          count: 3,
          axisDirection: Axis.horizontal,
          effect: SlideEffect(
            spacing: 6.0,
            radius: 5.0,
            dotWidth: 15.0,
            dotHeight: 10.0,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            dotColor: color,
            activeDotColor: AppColors.mainColor,
          ),
          activeIndex: controller.currentImageIndex,
        ),
      )
    ]);
  }
}
