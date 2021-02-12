import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.profileUrl,
    this.rating,
    this.tournamentsPlayed,
    this.tournamentsWon,
    this.winningPercentage,
  });

  final int id;
  final String name;
  final String profileUrl;
  final int rating;
  final int tournamentsPlayed;
  final int tournamentsWon;
  final int winningPercentage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        profileUrl: json["profile_url"] == null ? null : json["profile_url"],
        rating: json["rating"] == null ? null : json["rating"],
        tournamentsPlayed: json["tournaments_played"] == null
            ? null
            : json["tournaments_played"],
        tournamentsWon:
            json["tournaments_won"] == null ? null : json["tournaments_won"],
        winningPercentage: json["winning_percentage"] == null
            ? null
            : json["winning_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "profile_url": profileUrl == null ? null : profileUrl,
        "rating": rating == null ? null : rating,
        "tournaments_played":
            tournamentsPlayed == null ? null : tournamentsPlayed,
        "tournaments_won": tournamentsWon == null ? null : tournamentsWon,
        "winning_percentage":
            winningPercentage == null ? null : winningPercentage,
      };
}
