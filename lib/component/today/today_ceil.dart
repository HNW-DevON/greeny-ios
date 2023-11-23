import 'package:flutter/cupertino.dart';
import 'package:flutterproj/component/extension/widget.dart';
import 'package:flutterproj/component/text/gsv_text.dart';
import 'package:flutterproj/component/text/text_type.dart';
import 'package:flutterproj/theme/color.dart';

class TodayCeil extends StatelessWidget {

  final String product;
  final String detail;
  final String imageUrl;

  const TodayCeil({
    required this.product,
    required this.detail,
    required this.imageUrl,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorStyle.gray50,
                width: 1
              ),
              borderRadius: BorderRadius.circular(16)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(imageUrl, fit: BoxFit.cover,),
            )
          ),
          SizedBox(height: 4),
          Row(children: [GsvText(text: product, textType: TextType.label),],),
          SizedBox(height: 4),
          Row(children: [GsvText(text: detail, textType: TextType.caption, color: ColorStyle.gray500)])
        ],
      )
    );
  }
}