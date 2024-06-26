import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/user/change_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Name",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add real name to easy verifiction, this name will appear in several pages",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 1.5),
              Form(
                  key: controller.changeNameKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstName,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user_copy),
                          hintText: "First Name",
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TextFormField(
                        controller: controller.lastName,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user_copy),
                          hintText: "Last Name",
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.changeName(),
                          child: const Text("Save"),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
