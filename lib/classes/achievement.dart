// lib/classes/achievement.dart
import 'package:meta/meta.dart';

class Achievement {
  final String id;
  final String name;
  final String description;
  final String iconUrl;
  final int criteria;
  final bool isUnlocked;
  final int? currentProgress; // Added field

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.criteria,
    this.isUnlocked = false,
    this.currentProgress, // Added to constructor
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String,
      criteria: json['criteria'] as int,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
      currentProgress: json['currentProgress'] as int?, // Added
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'criteria': criteria,
      'isUnlocked': isUnlocked,
      'currentProgress': currentProgress, // Added
    };
  }

  Achievement copyWith({
    String? id,
    String? name,
    String? description,
    String? iconUrl,
    int? criteria,
    bool? isUnlocked,
    int? currentProgress, // Added
    bool setToNullCurrentProgress = false, // Helper to explicitly set currentProgress to null
  }) {
    return Achievement(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      criteria: criteria ?? this.criteria,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      currentProgress: setToNullCurrentProgress ? null : currentProgress ?? this.currentProgress, // Added
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Achievement &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          iconUrl == other.iconUrl &&
          criteria == other.criteria &&
          isUnlocked == other.isUnlocked &&
          currentProgress == other.currentProgress; // Added

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      iconUrl.hashCode ^
      criteria.hashCode ^
      isUnlocked.hashCode ^
      currentProgress.hashCode; // Added

  @override
  String toString() {
    return 'Achievement{id: $id, name: $name, description: $description, iconUrl: $iconUrl, criteria: $criteria, isUnlocked: $isUnlocked, currentProgress: $currentProgress}'; // Added
  }
}
