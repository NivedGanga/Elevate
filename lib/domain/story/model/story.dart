import 'dart:convert';

class StoryModel {
  String? message;

  StoryModel({this.message});

  @override
  String toString() => 'StoryModel(message: $message)';

  factory StoryModel.fromMap(Map<String, dynamic> data) => StoryModel(
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StoryModel].
  factory StoryModel.fromJson(String data) {
    return StoryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StoryModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
