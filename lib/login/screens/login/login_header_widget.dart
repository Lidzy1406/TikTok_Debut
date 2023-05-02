import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(tWelcomeScreenImage),
          height: size.height * 0.3,
        ),
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          tLoginSubTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
