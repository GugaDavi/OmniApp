class DevModel {
  List<String> techs;
  String id;
  String githubUsername;
  String name;
  String avatarUrl;
  String bio;
  Coordinates location;

  DevModel({
    this.techs,
    this.id,
    this.githubUsername,
    this.name,
    this.avatarUrl,
    this.bio,
    this.location,
  });

  DevModel.fromJson(Map<String, dynamic> json) {
    techs = json['techs'].cast<String>() ?? '';
    id = json['_id'] ?? '';
    githubUsername = json['github_username'] ?? '';
    name = json['name'] ?? '';
    avatarUrl = json['avatar_url'] ?? '';
    bio = json['bio'] ?? '';
    location = Coordinates(latitude: 0, longitude: 0);
    if (json['location'] != null) {
      if (json['location']['coordinates'] != null) {
        List<dynamic> data = json['location']['coordinates'];
        location = Coordinates(latitude: data[0], longitude: data[1]);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['techs'] = this.techs.join(', ');
    data['github_username'] = this.githubUsername;
    data['latitude'] = this.location.latitude.toString();
    data['longitude'] = this.location.longitude.toString();
    return data;
  }
}

class Coordinates {
  num latitude;
  num longitude;

  Coordinates({this.longitude, this.latitude});
}
