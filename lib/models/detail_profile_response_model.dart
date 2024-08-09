class DetailProfileResponseModel {
  Avatar? avatar;
  int? id;
  String? iso6391;
  String? iso31661;
  String? name;
  bool? includeAdult;
  String? username;

  DetailProfileResponseModel({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username,
  });

  factory DetailProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailProfileResponseModel(
        avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
        id: json["id"],
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        includeAdult: json["include_adult"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar?.toJson(),
        "id": id,
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "include_adult": includeAdult,
        "username": username,
      };
}

class Avatar {
  Gravatar? gravatar;
  Tmdb? tmdb;

  Avatar({
    this.gravatar,
    this.tmdb,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        gravatar: json["gravatar"] == null
            ? null
            : Gravatar.fromJson(json["gravatar"]),
        tmdb: json["tmdb"] == null ? null : Tmdb.fromJson(json["tmdb"]),
      );

  Map<String, dynamic> toJson() => {
        "gravatar": gravatar?.toJson(),
        "tmdb": tmdb?.toJson(),
      };
}

class Gravatar {
  String? hash;

  Gravatar({
    this.hash,
  });

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
      };
}

class Tmdb {
  String? avatarPath;

  Tmdb({
    this.avatarPath,
  });

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
        avatarPath: json["avatar_path"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_path": avatarPath,
      };
}
