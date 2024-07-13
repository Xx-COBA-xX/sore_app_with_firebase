import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sore_app_with_firebase/core/common/widgets/loaders/t_loaders.dart';
import 'package:sore_app_with_firebase/core/utils/constants/colors.dart';
import 'package:sore_app_with_firebase/core/utils/constants/images_string.dart';
import 'package:sore_app_with_firebase/core/utils/network/network_manager.dart';
import 'package:sore_app_with_firebase/core/utils/popups/full_screen_loadder.dart';
import 'package:sore_app_with_firebase/data/repository/address/address_repo.dart';
import 'package:sore_app_with_firebase/feaures/personalization/screens/addrass/user_addrass_screen.dart';

import '../../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddresses = AddressModel.empty().obs;
  final repo = Get.put(AddressRepo());

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final pastolCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool refrechDate = true.obs;
  Future<List<AddressModel>> fetchAllAddress() async {
    try {
      final addresses = await repo.getAllAddress();
      selectedAddresses.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Error", message: "Failed to fetch addresses $e");
      return [];
    }
  }

  selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: "",
        onWillPop: () async{
          return false;
        },
        titlePadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        barrierDismissible: false,
        content: Container(
          child: const CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      );
      if (selectedAddresses.value.id.isNotEmpty) {
        await repo.updateSelectAddress(selectedAddresses.value.id, false);
      }
      newSelectedAddress.selectedAddress = true;
      selectedAddresses.value = newSelectedAddress;
      await repo.updateSelectAddress(newSelectedAddress.id, true);
      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Error", message: "Failed to select addresses $e");
    }
  }

  addAddress() async {
    try {
      TFullScreenLoader.opneLoadeingDialog(
          "Add A New Address...", TImages.loaderAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!formKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      final address = AddressModel(
        id: "",
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        country: country.text.trim(),
        postalCode: pastolCode.text.trim(),
        dateTime: DateTime.now(),
        selectedAddress: true,
      );

      final id = await repo.addAddress(address);
      address.id = id;
      await selectAddress(address);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Successfully!",
          message: "Your a new address is successfully added");
      // to reset form field from date
      restForm();

      // to toggle refrech date
      refrechDate.toggle();

      Get.to(() => const UserAddrassScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message: "There some thing warng! in add a new address , try again");
    }
  }

  void restForm() {
    name.clear();
    phoneNumber.clear();
    city.clear();
    street.clear();
    state.clear();
    country.clear();
    pastolCode.clear();
    formKey.currentState?.reset();
  }
}
