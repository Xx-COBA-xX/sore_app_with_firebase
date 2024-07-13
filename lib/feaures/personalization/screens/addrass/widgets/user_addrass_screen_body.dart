// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/address/address_controller.dart';

import 'user_address_card.dart';

class UserAddrassScreenBody extends StatelessWidget {
  const UserAddrassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Obx(() {
              return FutureBuilder(
                  key: Key(controller.refrechDate.value.toString()),
                  future: controller.fetchAllAddress(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError ||
                        snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("No Address Found"),
                      );
                    }
                    final addresses = snapshot.data!;
                    return ListView.builder(
                      itemCount: addresses.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => UserAddrassCard(
                        address: addresses[index],
                        onTap: () {
                          controller.selectAddress(
                            addresses[index],
                          );
                        },
                      ),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
