class WallpaperUrlModel {
  
  const WallpaperUrlModel({
    required this.large2x,
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
    required this.potrait,
    required this.landscape,
    required this.tiny,
  });

  factory WallpaperUrlModel.fromMap(Map<String,dynamic> map){
    return WallpaperUrlModel(
    large2x: map['large2x'] as String, 
    original: map['original'] as String, 
    large: map['large'] as String, 
    medium: map['medium'] as String, 
    small: map['small'] as String, 
    potrait: map['portrait'] as String, 
    landscape: map['landscape'] as String, 
    tiny: map['tiny'] as String,
    );
  }
  
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String potrait;
  final String landscape;
  final String tiny;
  
  
}