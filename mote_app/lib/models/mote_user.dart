import 'package:equatable/equatable.dart';

class MoteUser extends Equatable {
  MoteUser({required this.uid});

  final String uid;

  @override
  List<Object?> get props => [uid];
}
