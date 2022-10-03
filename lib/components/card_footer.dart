import 'package:flutter/material.dart';

class CardFooterText extends StatelessWidget {
  const CardFooterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Made with \u2764 by anipy',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
