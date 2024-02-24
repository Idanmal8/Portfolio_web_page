// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Project {
  final String name;
  final List<String> languages;
  final String onPressedGit;
  final String? onPressedLink;
  bool isPrivate;
  Project({
    required this.name,
    required this.languages,
    required this.onPressedGit,
    this.onPressedLink,
    required this.isPrivate,
  });

  Project copyWith({
    String? name,
    List<String>? languages,
    String? onPressedGit,
    String? onPressedLink,
    bool? isPrivate,
  }) {
    return Project(
      name: name ?? this.name,
      languages: languages ?? this.languages,
      onPressedGit: onPressedGit ?? this.onPressedGit,
      onPressedLink: onPressedLink ?? this.onPressedLink,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'languages': languages,
      'onPressedGit': onPressedGit,
      'onPressedLink': onPressedLink,
      'isPrivate': isPrivate,
    };
  }

  @override
  String toString() {
    return 'Project(name: $name, languages: $languages, onPressedGit: $onPressedGit, onPressedLink: $onPressedLink, isPrivate: $isPrivate)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      listEquals(other.languages, languages) &&
      other.onPressedGit == onPressedGit &&
      other.onPressedLink == onPressedLink &&
      other.isPrivate == isPrivate;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      languages.hashCode ^
      onPressedGit.hashCode ^
      onPressedLink.hashCode ^
      isPrivate.hashCode;
  }


  String toJson() => json.encode(toMap());

}
