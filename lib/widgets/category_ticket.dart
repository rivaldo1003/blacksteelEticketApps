import 'package:epfl_blacksteel_manokwari/models/category.dart';
import 'package:epfl_blacksteel_manokwari/theme.dart';
import 'package:flutter/material.dart';

class CategoryTicket extends StatelessWidget {
  final Category category;

  CategoryTicket(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: category.isActive
          ? Container(
              child: Center(
                child: Text(
                  category.nameCategoryTicket,
                  style: poppinsTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              height: 28,
              width: 92,
              decoration: BoxDecoration(
                border: Border.all(
                  color: greyCardCategory,
                ),
                color: colorGold,
                borderRadius: BorderRadius.circular(5),
              ),
            )
          : Container(
              child: Center(
                child: Text(
                  category.nameCategoryTicket,
                  style: poppinsTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              height: 28,
              width: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: greyCardCategory,
                ),
              ),
            ),
    );
  }
}
