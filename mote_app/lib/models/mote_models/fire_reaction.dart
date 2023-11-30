class FireReaction {
  FireReaction({
    required this.reactions,
    required this.reactedUserIds,
  });

  /// Provides list of reaction in single message.
  final List<String> reactions;

  /// Provides list of user who reacted on message.
  final List<String> reactedUserIds;

  factory FireReaction.fromJson(Map<String, dynamic> json) => FireReaction(
        reactions: (json['reactions'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        reactedUserIds: (json['reactedUserIds'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => _$FireReactionToJson(this);

  Map<String, dynamic> _$FireReactionToJson(FireReaction instance) =>
      <String, dynamic>{
        'reactions': instance.reactions,
        'reactedUserIds': instance.reactedUserIds,
      };
}
