import 'package:flutter/material.dart';

import 'app_text.dart';

class ArticleBuilder extends StatelessWidget {
  final String title;
  final String imageUrl;
  const ArticleBuilder({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: Image.network(
            imageUrl,
          ).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.bookmark_border,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          AppText(
            text: title,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
