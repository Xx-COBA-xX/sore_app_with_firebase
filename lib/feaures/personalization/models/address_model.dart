import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sore_app_with_firebase/core/utils/formatters/app_formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    this.selectedAddress = true,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    this.dateTime,
  });

  String get formattedPhone => TFormatters.formatPhoneNumber(phoneNumber);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'postalCode': postalCode,
      'dateTime': dateTime,
      'selectedAddress': selectedAddress,
    };
  }

  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        street: '',
        city: '',
        state: '',
        country: '',
        postalCode: '',
      );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      selectedAddress: json['selectedAddress'] as bool,
    );
  }

  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data()!.isEmpty) return AddressModel.empty();
    final json = document.data()!;
    return AddressModel(
      id: document.id,
      name: json['name'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      street: json['street'] ?? "",
      city: json['city'] ?? "",
      state: json['state'] ?? "",
      country: json['country'] ?? "",
      postalCode: json['postalCode'] ?? "",
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      selectedAddress: json['selectedAddress'] ?? false,
    );
  }

  @override
  String toString() {
    return '$street, $city, $state, $postalCode , $country';
  }
}
