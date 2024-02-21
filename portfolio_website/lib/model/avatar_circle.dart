// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AvatarCircle {
  double pictureSize;
  double animationSize;
  double animationRadius;
  AvatarCircle({
    required this.pictureSize,
    required this.animationSize,
    required this.animationRadius,
  });

  AvatarCircle copyWith({
    double? pictureSize,
    double? animationSize,
    double? animationRadius,
  }) {
    return AvatarCircle(
      pictureSize: pictureSize ?? this.pictureSize,
      animationSize: animationSize ?? this.animationSize,
      animationRadius: animationRadius ?? this.animationRadius,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pictureSize': pictureSize,
      'animationSize': animationSize,
      'animationRadius': animationRadius,
    };
  }

  factory AvatarCircle.fromMap(Map<String, dynamic> map) {
    return AvatarCircle(
      pictureSize: map['pictureSize'] as double,
      animationSize: map['animationSize'] as double,
      animationRadius: map['animationRadius'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvatarCircle.fromJson(String source) => AvatarCircle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AvatarCircle(pictureSize: $pictureSize, animationSize: $animationSize, animationRadius: $animationRadius)';

  @override
  bool operator ==(covariant AvatarCircle other) {
    if (identical(this, other)) return true;
  
    return 
      other.pictureSize == pictureSize &&
      other.animationSize == animationSize &&
      other.animationRadius == animationRadius;
  }

  @override
  int get hashCode => pictureSize.hashCode ^ animationSize.hashCode ^ animationRadius.hashCode;
}
