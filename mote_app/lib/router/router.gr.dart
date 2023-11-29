// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AnonChatRoute.name: (routeData) {
      final args = routeData.argsAs<AnonChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnonChatScreen(
          key: args.key,
          anonChat: args.anonChat,
        ),
      );
    },
    AnonMessangerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnonMessangerScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatScreen(
          key: args.key,
          chat: args.chat,
        ),
      );
    },
    CompanyInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyInfoScreen(),
      );
    },
    CreateAnonChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateAnonChatScreen(),
      );
    },
    CreateChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateChatScreen(),
      );
    },
    CreateDateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateDateScreen(),
      );
    },
    DateMapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DateMapScreen(),
      );
    },
    DatesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DatesScreen(),
      );
    },
    DatingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DatingScreen(),
      );
    },
    FindAnonChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FindAnonChatScreen(),
      );
    },
    FindGenderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FindGenderScreen(),
      );
    },
    ForgotPassRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPassRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ForgotPassScreen(
          key: args.key,
          email: args.email,
        ),
      );
    },
    FriendShipRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FriendShipScreen(),
      );
    },
    HelpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MapRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MapScreen(),
      );
    },
    MeetsChatInfoRoute.name: (routeData) {
      final args = routeData.argsAs<MeetsChatInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MeetsChatInfoScreen(
          key: args.key,
          meet: args.meet,
        ),
      );
    },
    MeetsChatRoute.name: (routeData) {
      final args = routeData.argsAs<MeetsChatRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MeetsChatScreen(
          key: args.key,
          meet: args.meet,
        ),
      );
    },
    MeetsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MeetsScreen(),
      );
    },
    MenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuScreen(),
      );
    },
    MessangerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MessangerScreen(),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsScreen(),
      );
    },
    PassRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PassScreen(),
      );
    },
    PhoneVerifyRoute.name: (routeData) {
      final args = routeData.argsAs<PhoneVerifyRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhoneVerifyScreen(
          key: args.key,
          verCode: args.verCode,
          email: args.email,
        ),
      );
    },
    ProfilePhotoRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePhotoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePhotoScreen(
          key: args.key,
          image: args.image,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RegInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegInfoScreen(),
      );
    },
    RegProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    SettingsDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsDetailsScreen(
          key: args.key,
          widgetKey: args.widgetKey,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [AnonChatScreen]
class AnonChatRoute extends PageRouteInfo<AnonChatRouteArgs> {
  AnonChatRoute({
    Key? key,
    required AnonChatModel anonChat,
    List<PageRouteInfo>? children,
  }) : super(
          AnonChatRoute.name,
          args: AnonChatRouteArgs(
            key: key,
            anonChat: anonChat,
          ),
          initialChildren: children,
        );

  static const String name = 'AnonChatRoute';

  static const PageInfo<AnonChatRouteArgs> page =
      PageInfo<AnonChatRouteArgs>(name);
}

class AnonChatRouteArgs {
  const AnonChatRouteArgs({
    this.key,
    required this.anonChat,
  });

  final Key? key;

  final AnonChatModel anonChat;

  @override
  String toString() {
    return 'AnonChatRouteArgs{key: $key, anonChat: $anonChat}';
  }
}

/// generated route for
/// [AnonMessangerScreen]
class AnonMessangerRoute extends PageRouteInfo<void> {
  const AnonMessangerRoute({List<PageRouteInfo>? children})
      : super(
          AnonMessangerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnonMessangerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    Key? key,
    required FireChat chat,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            key: key,
            chat: chat,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<ChatRouteArgs> page = PageInfo<ChatRouteArgs>(name);
}

class ChatRouteArgs {
  const ChatRouteArgs({
    this.key,
    required this.chat,
  });

  final Key? key;

  final FireChat chat;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, chat: $chat}';
  }
}

/// generated route for
/// [CompanyInfoScreen]
class CompanyInfoRoute extends PageRouteInfo<void> {
  const CompanyInfoRoute({List<PageRouteInfo>? children})
      : super(
          CompanyInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateAnonChatScreen]
class CreateAnonChatRoute extends PageRouteInfo<void> {
  const CreateAnonChatRoute({List<PageRouteInfo>? children})
      : super(
          CreateAnonChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAnonChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateChatScreen]
class CreateChatRoute extends PageRouteInfo<void> {
  const CreateChatRoute({List<PageRouteInfo>? children})
      : super(
          CreateChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateDateScreen]
class CreateDateRoute extends PageRouteInfo<void> {
  const CreateDateRoute({List<PageRouteInfo>? children})
      : super(
          CreateDateRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateDateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DateMapScreen]
class DateMapRoute extends PageRouteInfo<void> {
  const DateMapRoute({List<PageRouteInfo>? children})
      : super(
          DateMapRoute.name,
          initialChildren: children,
        );

  static const String name = 'DateMapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DatesScreen]
class DatesRoute extends PageRouteInfo<void> {
  const DatesRoute({List<PageRouteInfo>? children})
      : super(
          DatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DatesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DatingScreen]
class DatingRoute extends PageRouteInfo<void> {
  const DatingRoute({List<PageRouteInfo>? children})
      : super(
          DatingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DatingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindAnonChatScreen]
class FindAnonChatRoute extends PageRouteInfo<void> {
  const FindAnonChatRoute({List<PageRouteInfo>? children})
      : super(
          FindAnonChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindAnonChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FindGenderScreen]
class FindGenderRoute extends PageRouteInfo<void> {
  const FindGenderRoute({List<PageRouteInfo>? children})
      : super(
          FindGenderRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindGenderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPassScreen]
class ForgotPassRoute extends PageRouteInfo<ForgotPassRouteArgs> {
  ForgotPassRoute({
    Key? key,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          ForgotPassRoute.name,
          args: ForgotPassRouteArgs(
            key: key,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPassRoute';

  static const PageInfo<ForgotPassRouteArgs> page =
      PageInfo<ForgotPassRouteArgs>(name);
}

class ForgotPassRouteArgs {
  const ForgotPassRouteArgs({
    this.key,
    required this.email,
  });

  final Key? key;

  final String email;

  @override
  String toString() {
    return 'ForgotPassRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [FriendShipScreen]
class FriendShipRoute extends PageRouteInfo<void> {
  const FriendShipRoute({List<PageRouteInfo>? children})
      : super(
          FriendShipRoute.name,
          initialChildren: children,
        );

  static const String name = 'FriendShipRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpScreen]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
      : super(
          HelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MapScreen]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
      : super(
          MapRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MeetsChatInfoScreen]
class MeetsChatInfoRoute extends PageRouteInfo<MeetsChatInfoRouteArgs> {
  MeetsChatInfoRoute({
    Key? key,
    required MeetsModels meet,
    List<PageRouteInfo>? children,
  }) : super(
          MeetsChatInfoRoute.name,
          args: MeetsChatInfoRouteArgs(
            key: key,
            meet: meet,
          ),
          initialChildren: children,
        );

  static const String name = 'MeetsChatInfoRoute';

  static const PageInfo<MeetsChatInfoRouteArgs> page =
      PageInfo<MeetsChatInfoRouteArgs>(name);
}

class MeetsChatInfoRouteArgs {
  const MeetsChatInfoRouteArgs({
    this.key,
    required this.meet,
  });

  final Key? key;

  final MeetsModels meet;

  @override
  String toString() {
    return 'MeetsChatInfoRouteArgs{key: $key, meet: $meet}';
  }
}

/// generated route for
/// [MeetsChatScreen]
class MeetsChatRoute extends PageRouteInfo<MeetsChatRouteArgs> {
  MeetsChatRoute({
    Key? key,
    required MeetsModels meet,
    List<PageRouteInfo>? children,
  }) : super(
          MeetsChatRoute.name,
          args: MeetsChatRouteArgs(
            key: key,
            meet: meet,
          ),
          initialChildren: children,
        );

  static const String name = 'MeetsChatRoute';

  static const PageInfo<MeetsChatRouteArgs> page =
      PageInfo<MeetsChatRouteArgs>(name);
}

class MeetsChatRouteArgs {
  const MeetsChatRouteArgs({
    this.key,
    required this.meet,
  });

  final Key? key;

  final MeetsModels meet;

  @override
  String toString() {
    return 'MeetsChatRouteArgs{key: $key, meet: $meet}';
  }
}

/// generated route for
/// [MeetsScreen]
class MeetsRoute extends PageRouteInfo<void> {
  const MeetsRoute({List<PageRouteInfo>? children})
      : super(
          MeetsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MeetsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MessangerScreen]
class MessangerRoute extends PageRouteInfo<void> {
  const MessangerRoute({List<PageRouteInfo>? children})
      : super(
          MessangerRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessangerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PassScreen]
class PassRoute extends PageRouteInfo<void> {
  const PassRoute({List<PageRouteInfo>? children})
      : super(
          PassRoute.name,
          initialChildren: children,
        );

  static const String name = 'PassRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhoneVerifyScreen]
class PhoneVerifyRoute extends PageRouteInfo<PhoneVerifyRouteArgs> {
  PhoneVerifyRoute({
    Key? key,
    required int verCode,
    required String email,
    List<PageRouteInfo>? children,
  }) : super(
          PhoneVerifyRoute.name,
          args: PhoneVerifyRouteArgs(
            key: key,
            verCode: verCode,
            email: email,
          ),
          initialChildren: children,
        );

  static const String name = 'PhoneVerifyRoute';

  static const PageInfo<PhoneVerifyRouteArgs> page =
      PageInfo<PhoneVerifyRouteArgs>(name);
}

class PhoneVerifyRouteArgs {
  const PhoneVerifyRouteArgs({
    this.key,
    required this.verCode,
    required this.email,
  });

  final Key? key;

  final int verCode;

  final String email;

  @override
  String toString() {
    return 'PhoneVerifyRouteArgs{key: $key, verCode: $verCode, email: $email}';
  }
}

/// generated route for
/// [ProfilePhotoScreen]
class ProfilePhotoRoute extends PageRouteInfo<ProfilePhotoRouteArgs> {
  ProfilePhotoRoute({
    Key? key,
    required String image,
    List<PageRouteInfo>? children,
  }) : super(
          ProfilePhotoRoute.name,
          args: ProfilePhotoRouteArgs(
            key: key,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePhotoRoute';

  static const PageInfo<ProfilePhotoRouteArgs> page =
      PageInfo<ProfilePhotoRouteArgs>(name);
}

class ProfilePhotoRouteArgs {
  const ProfilePhotoRouteArgs({
    this.key,
    required this.image,
  });

  final Key? key;

  final String image;

  @override
  String toString() {
    return 'ProfilePhotoRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegInfoScreen]
class RegInfoRoute extends PageRouteInfo<void> {
  const RegInfoRoute({List<PageRouteInfo>? children})
      : super(
          RegInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegProfileScreen]
class RegProfileRoute extends PageRouteInfo<void> {
  const RegProfileRoute({List<PageRouteInfo>? children})
      : super(
          RegProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsDetailsScreen]
class SettingsDetailsRoute extends PageRouteInfo<SettingsDetailsRouteArgs> {
  SettingsDetailsRoute({
    Key? key,
    required int widgetKey,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsDetailsRoute.name,
          args: SettingsDetailsRouteArgs(
            key: key,
            widgetKey: widgetKey,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsDetailsRoute';

  static const PageInfo<SettingsDetailsRouteArgs> page =
      PageInfo<SettingsDetailsRouteArgs>(name);
}

class SettingsDetailsRouteArgs {
  const SettingsDetailsRouteArgs({
    this.key,
    required this.widgetKey,
  });

  final Key? key;

  final int widgetKey;

  @override
  String toString() {
    return 'SettingsDetailsRouteArgs{key: $key, widgetKey: $widgetKey}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
