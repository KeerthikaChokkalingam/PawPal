import 'dart:convert';

import 'package:flutter/material.dart';

class Animal {
  final int id;
  final String? organizationId;
  final String? url;
  final String? type;
  final String? species;
  final Breeds? breeds;
  final SkinColors? colors;
  final String? age;
  final String? gender;
  final String? size;
  final String? coat;
  final Attributes? attributes;
  final Environment? environment;
  final List<String>? tags;
  final String? name;
  final String? description;
  final String? organizationAnimalId;
  final List<Photo>? photos;
  final Photo? primaryPhotoCropped;
  final List<String>? videos;
  final String? status;
  final String? statusChangedAt;
  final String? publishedAt;
  final double? distance;
  final Contact? contact;

  Animal({
    required this.id,
    this.organizationId,
    this.url,
    this.type,
    this.species,
    this.breeds,
    this.colors,
    this.age,
    this.gender,
    this.size,
    this.coat,
    this.attributes,
    this.environment,
    this.tags,
    this.name,
    this.description,
    this.organizationAnimalId,
    this.photos,
    this.primaryPhotoCropped,
    this.videos,
    this.status,
    this.statusChangedAt,
    this.publishedAt,
    this.distance,
    this.contact,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      organizationId: json['organization_id'],
      url: json['url'],
      type: json['type'],
      species: json['species'],
      breeds: json['breeds'] != null ? Breeds.fromJson(json['breeds']) : null,
      colors: json['colors'] != null ? SkinColors.fromJson(json['colors']) : null,
      age: json['age'],
      gender: json['gender'],
      size: json['size'],
      coat: json['coat'],
      attributes: json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null,
      environment: json['environment'] != null ? Environment.fromJson(json['environment']) : null,
      tags: (json['tags'] as List?)?.map((e) => e.toString()).toList(),
      name: json['name'],
      description: json['description'],
      organizationAnimalId: json['organization_animal_id'],
      photos: (json['photos'] as List?)?.map((e) => Photo.fromJson(e)).toList(),
      primaryPhotoCropped: json['primary_photo_cropped'] != null
          ? Photo.fromJson(json['primary_photo_cropped'])
          : null,
      videos: (json['videos'] as List?)?.map((e) => e.toString()).toList(),
      status: json['status'],
      statusChangedAt: json['status_changed_at'],
      publishedAt: json['published_at'],
      distance: json['distance'] != null ? (json['distance'] as num).toDouble() : null,
      contact: json['contact'] != null ? Contact.fromJson(json['contact']) : null,
    );
  }
}

class Breeds {
  final String? primary;
  final String? secondary;
  final bool? mixed;
  final bool? unknown;

  Breeds({this.primary, this.secondary, this.mixed, this.unknown});

  factory Breeds.fromJson(Map<String, dynamic> json) {
    return Breeds(
      primary: json['primary'],
      secondary: json['secondary'],
      mixed: json['mixed'],
      unknown: json['unknown'],
    );
  }
}

class SkinColors {
  final String? primary;
  final String? secondary;
  final String? tertiary;

  SkinColors({this.primary, this.secondary, this.tertiary});

  factory SkinColors.fromJson(Map<String, dynamic> json) {
    return SkinColors(
      primary: json['primary'],
      secondary: json['secondary'],
      tertiary: json['tertiary'],
    );
  }
}

class Attributes {
  final bool? spayedNeutered;
  final bool? houseTrained;
  final bool? declawed;
  final bool? specialNeeds;
  final bool? shotsCurrent;

  Attributes({
    this.spayedNeutered,
    this.houseTrained,
    this.declawed,
    this.specialNeeds,
    this.shotsCurrent,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      spayedNeutered: json['spayed_neutered'],
      houseTrained: json['house_trained'],
      declawed: json['declawed'],
      specialNeeds: json['special_needs'],
      shotsCurrent: json['shots_current'],
    );
  }
}

class Environment {
  final bool? children;
  final bool? dogs;
  final bool? cats;

  Environment({this.children, this.dogs, this.cats});

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      children: json['children'],
      dogs: json['dogs'],
      cats: json['cats'],
    );
  }
}

class Photo {
  final String? small;
  final String? medium;
  final String? large;
  final String? full;

  Photo({this.small, this.medium, this.large, this.full});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
      full: json['full'],
    );
  }
}

class Contact {
  final String? email;
  final String? phone;
  final Address? address;

  Contact({this.email, this.phone, this.address});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'],
      phone: json['phone'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
    );
  }
}

class Address {
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;

  Address({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      state: json['state'],
      postcode: json['postcode'],
      country: json['country'],
    );
  }
}
List<Animal> parseAnimals(String jsonStr) {
  final parsed = jsonDecode(jsonStr);
  final animalsList = parsed['animals'] as List;
  return animalsList.map((e) => Animal.fromJson(e)).toList();
}
Future<void> ShowMyDialog(BuildContext context,String message,String titleAlert) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titleAlert),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}