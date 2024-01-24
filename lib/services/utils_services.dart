import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilServices {
  priceToCurrency(double value) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(
      locale: 'pt_BR',
    );
    
    return numberFormat.format(value);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

}