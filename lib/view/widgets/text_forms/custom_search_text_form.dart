import 'package:fashion_store/logic/controllers/products_controller.dart';
import 'package:fashion_store/utils/themes/colors.dart';
import 'package:fashion_store/validations/validator_methods.dart';
import 'package:fashion_store/view/widgets/text_forms/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextForm extends StatelessWidget {
  SearchTextForm({
    super.key,
    required this.focusNode,
  });

  final productController = Get.find<ProductsController>();
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        elevation: 5,
        child: Obx(() {
          return CustomTextForm(
            onChanged: (searchTitle) {
              productController.addToSeachList(
                  searchTitle: searchTitle.toLowerCase());
            },
            suffixIconButton: productController.searchList.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      productController.clearSeachList();
                    },
                    icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: AppColors.mainColor,
                    ),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            validator: ValidatorMethods.validationOfSearch,
            fontSize: 15,
            controller: productController.searchController,
            keyboardType: TextInputType.text,
            hintText: 'Search you `re looking for',
            prefixIconData: Icons.search_rounded,
            focusNode: focusNode,
          );
        }),
      ),
    );
  }
}
