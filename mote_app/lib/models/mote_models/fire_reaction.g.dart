// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireReaction _$FireReactionFromJson(Map<String, dynamic> json) => FireReaction(
      reactions:
          (json['reactions'] as List<dynamic>).map((e) => e as String).toList(),
      reactedUserIds: (json['reactedUserIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FireReactionToJson(FireReaction instance) =>
    <String, dynamic>{
      'reactions': instance.reactions,
      'reactedUserIds': instance.reactedUserIds,
    };
