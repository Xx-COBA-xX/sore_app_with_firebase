import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';

class AddNewAddrassScreenBody extends StatelessWidget {
  const AddNewAddrassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Iconsax.user_copy,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(
                    Iconsax.mobile_copy,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Street',
                        prefixIcon: Icon(CupertinoIcons.rhombus),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputField),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Street',
                        prefixIcon: Icon(Iconsax.code_1_copy),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'City',
                        prefixIcon: Icon(Iconsax.building_copy),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputField),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'State',
                        prefixIcon: Icon(Iconsax.card_edit_copy),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Country',
                  prefixIcon: Icon(Iconsax.global_copy),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
