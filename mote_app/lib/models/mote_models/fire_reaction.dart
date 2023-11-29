part 'fire_reaction.g.dart';

class FireReaction {
  FireReaction({
    required this.reactions,
    required this.reactedUserIds,
  });

  /// Provides list of reaction in single message.
  final List<String> reactions;

  /// Provides list of user who reacted on message.
  final List<String> reactedUserIds;

  factory FireReaction.fromJson(Map<String, dynamic> json) =>
      _$FireReactionFromJson(json);

  Map<String, dynamic> toJson() => _$FireReactionToJson(this);
}
