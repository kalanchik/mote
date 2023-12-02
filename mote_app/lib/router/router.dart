import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/models/mote_models/fire_chat.dart';
import 'package:mote_app/screens/Login_screen/view/login_screen.dart';
import 'package:mote_app/screens/anon_chat_screen/view/anon_chat_screen.dart';
import 'package:mote_app/screens/anon_messanger_screen/view/anon_messanger_screen.dart';
import 'package:mote_app/screens/chat_screen/view/chat_screen.dart';
import 'package:mote_app/screens/company_info/view/company_info_screen.dart';
import 'package:mote_app/screens/create_anon_chat_screen/view/create_anon_chat_screen.dart';
import 'package:mote_app/screens/create_chat_screen/view/create_chat_screen.dart';
import 'package:mote_app/screens/create_date_screen/view/create_date_screen.dart';
import 'package:mote_app/screens/create_meet_screen/view/create_meet_screen.dart';
import 'package:mote_app/screens/date_map_screen/view/date_map_screen.dart';
import 'package:mote_app/screens/dates_screen/view/dates_screen.dart';
import 'package:mote_app/screens/dating_screen/view/dating_screen.dart';
import 'package:mote_app/screens/find_anon_chat_screen/view/find_anon_chat_screen.dart';
import 'package:mote_app/screens/find_gender_screen/view/find_gender_screen.dart';
import 'package:mote_app/screens/forgot_pass_screen/view/forgot_pass_screen.dart';
import 'package:mote_app/screens/main_screens/friendship_screen/view/friendship_screen.dart';
import 'package:mote_app/screens/main_screens/home_screen/home_screen.dart';
import 'package:mote_app/screens/main_screens/map_screen/view/map_screen.dart';
import 'package:mote_app/screens/main_screens/meets_screen/view/meets_screen.dart';
import 'package:mote_app/screens/main_screens/messanger_screen/view/messanger_screen.dart';
import 'package:mote_app/screens/main_screens/news_screen/view/news_screen.dart';
import 'package:mote_app/screens/meets_chat_screen/view/meets_chat_screen.dart';
import 'package:mote_app/screens/meets_chat_screen/view/meets_info_screen.dart';
import 'package:mote_app/screens/menu_screen/view/menu_screen.dart';
import 'package:mote_app/screens/pass_screen/view/pass_screen.dart';
import 'package:mote_app/screens/phone_verify_screen/view/phone_verify_screen.dart';
import 'package:mote_app/screens/profile/view/profile_photo_screen.dart';
import 'package:mote_app/screens/profile/view/profile_screen.dart';
import 'package:mote_app/screens/reg_info_screen/view/reg_info_screen.dart';
import 'package:mote_app/screens/reg_profile_screen/view/reg_profile_screen.dart';
import 'package:mote_app/screens/register_screen/view/register_screen.dart';
import 'package:mote_app/screens/settings_details/view/settings_details_screen.dart';

import '../screens/help_screen/view/help_screen.dart';
import '../screens/settings_screen/view/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/'),
        AutoRoute(page: PhoneVerifyRoute.page, path: '/verify'),
        AutoRoute(page: RegInfoRoute.page, path: '/reg1'),
        AutoRoute(page: FindGenderRoute.page, path: '/reg2'),
        AutoRoute(page: RegProfileRoute.page, path: '/regprofile'),
        AutoRoute(page: DatingRoute.page, path: '/dating'),
        AutoRoute(page: ChatRoute.page, path: '/chat'),
        AutoRoute(page: AnonChatRoute.page, path: '/anonchat'),
        AutoRoute(page: CreateAnonChatRoute.page, path: '/createanonchat'),
        AutoRoute(page: FindAnonChatRoute.page, path: '/findanonchat'),
        AutoRoute(page: MeetsChatRoute.page, path: '/meetchat'),
        AutoRoute(page: MeetsChatInfoRoute.page, path: '/meetinfo'),
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
        AutoRoute(page: ProfilePhotoRoute.page, path: '/profilephoto'),
        AutoRoute(page: CompanyInfoRoute.page, path: '/companyinfo'),
        AutoRoute(page: HelpRoute.page, path: '/help'),
        AutoRoute(page: SettingsRoute.page, path: '/settings'),
        AutoRoute(page: SettingsDetailsRoute.page, path: '/settingsdetails'),
        AutoRoute(page: FriendShipRoute.page, path: '/friendship'),
        AutoRoute(page: DatesRoute.page, path: '/dates'),
        AutoRoute(page: MessangerRoute.page, path: '/messanger'),
        AutoRoute(page: MeetsRoute.page, path: '/meets'),
        AutoRoute(page: DateMapRoute.page, path: '/datemap'),
        AutoRoute(page: ForgotPassRoute.page, path: '/forgotpass'),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
        AutoRoute(page: CreateChatRoute.page, path: '/createchat'),
        AutoRoute(page: CreateMeetRoute.page, path: '/createMeet'),
        AutoRoute(
          page: AnonMessangerRoute.page,
          path: '/anonmessanger',
        ),
        AutoRoute(
          page: CreateDateRoute.page,
          path: '/createdate',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          children: [
            AutoRoute(page: MenuRoute.page, path: 'menu'),
            AutoRoute(page: NewsRoute.page, path: 'news'),
            AutoRoute(page: MapRoute.page, path: 'map'),
            AutoRoute(page: PassRoute.page, path: 'pass'),
          ],
        ),
      ];
}
