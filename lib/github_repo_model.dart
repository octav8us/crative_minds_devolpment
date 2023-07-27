import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'github_repo_model.g.dart';

@HiveType(typeId: 0)
class GithubRepo {

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;
  @HiveField(2)
  String fullName;

  @HiveField(3)
  String htmlUrl;
  @HiveField(4)
  String description;
  @HiveField(5)
  bool fork;
  @HiveField(6)
  String url;

  GithubRepo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
  });

  factory GithubRepo.fromJson(Map<String, dynamic> json) {
    return GithubRepo(
      id: json['id'],
      name: json['name'],
      fullName: json['full_name'],
      htmlUrl: json['html_url'],
      description: json['description'],
      fork: json['fork'],
      url: json['url'],
    );
  }

}

