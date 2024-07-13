import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:sore_app_with_firebase/core/utils/constants/sizes.dart';
import 'package:sore_app_with_firebase/core/utils/validators/validator.dart';
import 'package:sore_app_with_firebase/feaures/personalization/controller/address/address_controller.dart';

class AddNewAddrassScreenBody extends StatelessWidget {
  const AddNewAddrassScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                validator: (value) => TValidator.textValidator(value, "Name"),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Iconsax.user_copy,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => TValidator.validatorPhoneNumber(value),
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
                      validator: (value) =>
                          TValidator.textValidator(value, "Street"),
                      controller: controller.street,
                      decoration: const InputDecoration(
                        labelText: 'Street',
                        prefixIcon: Icon(CupertinoIcons.rhombus),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputField),
                  Expanded(
                    child: TextFormField(
                      validator: (value) =>
                          TValidator.textValidator(value, "Pastol Code"),
                      controller: controller.pastolCode,
                      decoration: const InputDecoration(
                        labelText: 'Pastol Code',
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
                      validator: (value) =>
                          TValidator.textValidator(value, "City"),
                      controller: controller.city,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        prefixIcon: Icon(Iconsax.building_copy),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputField),
                  Expanded(
                    child: TextFormField(
                      validator: (value) =>
                          TValidator.textValidator(value, "State"),
                      controller: controller.state,
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
                validator: (value) =>
                    TValidator.textValidator(value, "Country"),
                controller: controller.country,
                decoration: const InputDecoration(
                  labelText: 'Country',
                  prefixIcon: Icon(Iconsax.global_copy),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputField),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.addAddress(),
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
