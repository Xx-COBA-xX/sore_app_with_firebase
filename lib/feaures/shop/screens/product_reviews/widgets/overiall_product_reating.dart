import 'package:flutter/material.dart';

import 't_reating_prograss_indicator.dart';


class OveriallProductReating extends StatelessWidget {
  const OveriallProductReating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 3,
            child: Text(
              "4.8",
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TReatingPrograssIndicator(
                text: "5",
                value: 1.0,
              ),
              TReatingPrograssIndicator(
                text: "4",
                value: .8,
              ),
              TReatingPrograssIndicator(
                text: "3",
                value: .6,
              ),
              TReatingPrograssIndicator(
                text: "2",
                value: .4,
              ),
              TReatingPrograssIndicator(
                text: "1",
                value: .2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
