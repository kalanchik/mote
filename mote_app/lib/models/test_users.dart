import 'package:mote_app/models/anon_chat_model.dart';
import 'package:mote_app/models/chat.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/models/meets_models.dart';
import 'package:mote_app/models/message.dart';
import 'package:mote_app/models/user_model.dart';

class TestUsers {
  static List<MeetsModels> myMeetsList = [];
  static List<MeetsModels> findMeetsList = [];

  static AnonChatModel anonChat1 = AnonChatModel(
    chatId: 15,
    chatTheme: 'Политика',
    user1: dima,
    user2Gender: 'Парень',
    user1Gender: 'Парень',
    ageRange: '16-24',
    showGender: true,
    showAge: false,
    createDate: '12.10.23',
    messages: [],
    desc:
        'Deserunt mollit cillum voluptate cupidatat excepteur anim elit reprehenderit proident magna voluptate.',
  );

  static AnonChatModel anonChat2 = AnonChatModel(
    chatId: 16,
    chatTheme: 'Просто общение',
    user1: dima,
    user2Gender: 'Девушка',
    user1Gender: 'Не важно',
    ageRange: '14-18',
    showGender: false,
    showAge: true,
    createDate: '13.10.23',
    messages: [],
    desc:
        'Adipisicing in proident laboris culpa pariatur officia et nulla cupidatat eu id laborum enim sint.',
  );

  static AnonChatModel anonChat3 = AnonChatModel(
    chatId: 17,
    chatTheme: 'Есть ли тут адекватные',
    user1: dima,
    user2Gender: 'Парень',
    user1Gender: 'Парень',
    ageRange: '1-100',
    showGender: false,
    showAge: true,
    createDate: '14.10.23',
    messages: [],
    desc: 'Ea qui quis velit reprehenderit consectetur do.',
  );

  static List<AnonChatModel> findAnonChatsList = [
    anonChat1,
    anonChat2,
    anonChat3,
  ];

  static List<User> users = [
    dima,
    anna,
    zlata,
  ];

  static List<Chat> chats = [
    Chat(
      user1: dima,
      user2: anna,
      messages: testMessages,
    ),
    Chat(
      user1: dima,
      user2: zlata,
      messages: testMessages,
    ),
  ];

  static List<AnonChatModel> anonChats = [
    AnonChatModel(
      chatId: 1,
      createDate: '12.10.23',
      chatTheme: 'Просто общение',
      user1: dima,
      user2: anna,
      user2Gender: 'Парень',
      user1Gender: 'Девушка',
      ageRange: '1-100',
      showGender: false,
      showAge: false,
      messages: testMessages,
      desc: 'Tempor pariatur enim labore ex labore occaecat adipisicing ut.',
    ),
    AnonChatModel(
      chatId: 2,
      createDate: '13.10.23',
      chatTheme: 'Давай поболтаем',
      user1: dima,
      user2: zlata,
      user2Gender: 'Девушка',
      user1Gender: 'Парень',
      ageRange: '14-18',
      showGender: false,
      showAge: false,
      messages: testMessages,
      desc:
          'Consectetur mollit velit est adipisicing in dolor ullamco Lorem elit.',
    ),
  ];

  static List<Message> testMessages = [
    Message(
      userid: dima.id,
      message: 'Привет, как дела?',
      sendDate: '12.10.23',
    ),
    Message(
      userid: zlata.id,
      message: 'Привет, отлично!',
      sendDate: '12.10.23',
    ),
    Message(
      userid: dima.id,
      message: 'Как тебе приложение?',
      sendDate: '12.10.23',
    ),
    Message(
      userid: dima.id,
      message: 'Ты тоже здесь недавно?',
      sendDate: '12.10.23',
    ),
    Message(
      userid: zlata.id,
      message:
          'Очень круто все сделано! И самое главное удобное! Мне очень нравиться!',
      sendDate: '12.10.23',
    ),
    Message(
      userid: dima.id,
      message:
          'Да,мне тоже нравиться! Анкеты очень круто смотряться! А свидания в слепую вообще пушка!',
      sendDate: '12.10.23',
    ),
    Message(
      userid: zlata.id,
      message:
          'Я свидания еще не пробовала, но говорят, что очень интересная штука',
      sendDate: '12.10.23',
    ),
  ];

  static User dima = User(
    id: 1,
    name: 'Дима',
    male: 'Парень',
    age: 19,
    imgUrls: [
      ...List<String>.generate(
        5,
        (index) {
          return '${Constants.imagePath}dima$index.jpg';
        },
      )
    ],
    interestList: [
      '📷 Фотография',
      '📹 Видеосъемка',
      '👩‍💻 Дизайн',
      '💄 Макияж',
      '🧵 Рукоделие',
      '🕺 Танцы',
      '🎤 Вокал',
      '🎧 Музыка',
      '📝 Ведение блога',
      '🎨 Рисование',
    ],
    city: 'Нижний Новгород',
    desc:
        'Et amet ut fugiat ex deserunt nostrud labore aliquip sit reprehenderit. Sint do veniam cillum tempor pariatur in do. Laborum commodo quis labore enim aliquip. Ad amet excepteur voluptate commodo quis ullamco. Ut proident elit voluptate eiusmod non dolore dolore duis duis mollit cupidatat.',
    sign: '♑ Козерог',
    education: 'НГТУ Им. Р.Е.Алексеева',
    work: 'Не работаю',
  );
  static User anna = User(
    id: 1,
    name: 'Аня',
    male: 'Девушка',
    age: 19,
    imgUrls: [
      ...List<String>.generate(
        4,
        (index) {
          return '${Constants.imagePath}anna$index.jpg';
        },
      )
    ],
    interestList: [
      '🏃‍♀️ Бег',
      '💪 Фитнес',
      '🚴‍♂️ Велосипед',
      '🦓 Верховая езда',
      '🎿 Лыжи',
      '🧘‍♂️ Йога',
      '🤾 Пилатес',
      '🏂 Сноуборд',
      '🛼 Ролики',
      '🛹 Скейтборд',
      '🛴 Самокат',
    ],
    city: 'Нижний Новгород',
    desc:
        'Et amet ut fugiat ex deserunt nostrud labore aliquip sit reprehenderit. Sint do veniam cillum tempor pariatur in do. Laborum commodo quis labore enim aliquip. Ad amet excepteur voluptate commodo quis ullamco. Ut proident elit voluptate eiusmod non dolore dolore duis duis mollit cupidatat.',
    sign: '♍ Дева',
    education: 'НИУ ВШЭ',
    work: 'Не работаю',
  );
  static User zlata = User(
    id: 3,
    name: 'Злата',
    male: 'Девушка',
    age: 18,
    imgUrls: [
      ...List<String>.generate(
        4,
        (index) {
          return '${Constants.imagePath}zlata$index.jpg';
        },
      )
    ],
    interestList: [
      '🍕 Пицца',
      '🍣 Суши',
      '🍔 Бургеры',
      '🥦 Здоровое питание',
      '🥒 Веганство',
      '🍏 Вегатарианство',
      '🥤 Кофе',
      '🫖 Чай',
      '🍪 Выпечка',
      '🍬 Сладости',
    ],
    city: 'Москва',
    desc:
        'Et amet ut fugiat ex deserunt nostrud labore aliquip sit reprehenderit. Sint do veniam cillum tempor pariatur in do. Laborum commodo quis labore enim aliquip. Ad amet excepteur voluptate commodo quis ullamco. Ut proident elit voluptate eiusmod non dolore dolore duis duis mollit cupidatat.',
    sign: '♒ Водолей',
    education: 'Хз что за вуз',
    work: 'Не работаю',
  );
}
