import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  VideoModel(this.name, this.url);

  final String name;
  final String url;

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}
