import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'uz_UZ': {
          'Home': 'Bosh sahifa',
          'search': 'Qidiruv',
          'cart': 'Savatcha',
          'Desire': 'Sevimli',
          'cobinet': 'Kobinet',
        },
        'ru_RU': {
          'Home': 'Главная',
          'search': 'Поиск',
          'cart': 'Корзина',
          'Desire': 'Желание',
          'cobinet': 'Кабинет',
        },
        'en_US': {
          'Home': 'Home',
          'search': 'Search',
          'cart': 'Cart',
          'Desire': 'Desire',
          'cobinet': 'Cabinet',
        },
      };
}
