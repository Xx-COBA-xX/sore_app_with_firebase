import 'package:flutter/material.dart';
import 'package:sore_app_with_firebase/core/common/widgets/custom/costom_app_bar.dart';

import 'widgets/add_new_addrass_screen_body.dart';

class AddNewAddrassScreen extends StatelessWidget {
  const AddNewAddrassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: const AddNewAddrassScreenBody(),
    );
  }
}
