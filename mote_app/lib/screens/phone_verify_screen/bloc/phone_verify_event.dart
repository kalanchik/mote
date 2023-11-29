part of 'phone_verify_bloc.dart';

abstract class PhoneVerifyEvent extends Equatable {}

class PhoneVerifyStart extends PhoneVerifyEvent {
  final BuildContext context;

  PhoneVerifyStart({required this.context});
  @override
  List<Object?> get props => [
        context,
      ];
}
