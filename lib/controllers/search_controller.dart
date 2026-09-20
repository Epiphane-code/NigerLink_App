import 'package:e_services_niger/models/place.dart';
import 'package:e_services_niger/models/service.dart';

class Searchcontroller {
  List<dynamic> filter(
    String query,
    List<ServiceModel> services,
    List<Place>? places,
  ) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty && places != null) {
      return [...services, ...places];
    } else if (places != null) {
      return [
        ...services.where(
          (s) =>
              s.categorieVal.toLowerCase().contains(q) ||
              s.nomserviceVal.toLowerCase().contains(q) ||
              s.sousCategorieVal.toLowerCase().contains(q),
        ),
        ...places.where(
          (p) =>
              p.name.toLowerCase().contains(q) ||
              p.type.toLowerCase().contains(q) ||
              p.address.toLowerCase().contains(q),
        ),
      ];
    } else {
      return [
        ...services.where(
          (s) =>
              s.categorieVal.toLowerCase().contains(q) ||
              s.nomserviceVal.toLowerCase().contains(q) ||
              s.sousCategorieVal.toLowerCase().contains(q),
        ),
      ];
    }
  }
}
