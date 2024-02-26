import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:books_app/src/feature/library/presentation/screens/card_details.dart';
import 'package:books_app/src/feature/library/presentation/widgets/card_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatefulWidget {
  final BookCard card;

  const CardWidget({
    super.key,
    required this.card,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (context) => CardDetailsScreen(
              card: widget.card,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(20.dg),
        child: Container(
          padding: EdgeInsets.all(20.dg),
          width: 350.w,
          height: 140.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80.w,
                height: 100.h,
                child: Image.asset(
                  'assets/images/no_image.png',
                  scale: 0.5,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.card.genre ?? '',
                    style: TextStyles.labelText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.card.title ?? '',
                    style: TextStyles.settingTileText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    widget.card.author ?? '',
                    style: TextStyles.labelText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              CardOptionsWidget(
                widget: widget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
