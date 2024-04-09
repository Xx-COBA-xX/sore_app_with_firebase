import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';

import 'widgets/checkout_screen_body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Order Review",style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const CheckOutScreenBody(),
    );
  }
}
