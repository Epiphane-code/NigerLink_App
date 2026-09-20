import 'package:e_services_niger/models/categorie.dart';
import 'package:e_services_niger/models/info.dart';
import 'package:e_services_niger/models/numero_urgence.dart';
import 'package:e_services_niger/models/service.dart';
import 'package:e_services_niger/models/user.dart';
import 'package:e_services_niger/repositories/categorie_repositorie.dart';
import 'package:e_services_niger/repositories/info_repositorie.dart';
import 'package:e_services_niger/repositories/services_repositorie.dart';
import 'package:e_services_niger/repositories/urgences_repositorie.dart';
import 'package:e_services_niger/repositories/users_repositorie.dart';

class Data {



  UserModel login(String telephone, String password) {
    try {
      for (Map<String, dynamic> user in users) {
        if (user['telephoneVal'] == telephone &&
            user['passwordVal'] == password) {
          return UserModel.fromMap(user);
        }
      }

      throw Exception('Login incorrect');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<CategorieModel> getCategories() {
    List<CategorieModel> liste = [];
    try {
      for (Map<String, dynamic> map in categories) {
        liste.add(CategorieModel.fromMap(map));
      }
      return liste;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
   List<InfoModel> getInfos() {
    List<InfoModel> liste = [];
    try {
      print('conversion info depuis controller data');
      for (Map<String, dynamic> map in infosData) {
        liste.add(InfoModel.fromMap(map));
      }
      print('fin conversion info depuis controller data');


      return liste;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  List<ServiceModel> getServices() {
    List<ServiceModel> liste = [];
    try {
      for (Map<String, dynamic> map in services) {
          liste.add(ServiceModel.fromMap(map));
      }
      return liste;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  UserModel getUser(int id, int token) {
    try {
      for (Map<String, dynamic> user in users) {
        if (user['userIdVal'] == token &&
            (user['roleVal'] == 'admin' || user['roleVal'] == 'superAdmin')) {
          for (Map<String, dynamic> userRecherche in users) {
            if (userRecherche['userIdVal'] == id) {
              return UserModel.fromMap(userRecherche);
            }
          }
          throw Exception('Utilisateur non trouver');
        }
      }
      throw Exception('Aucune autorisation');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void deleteService(int idVal) {
    try {
      services.removeWhere((item) => item['idVal'] == idVal);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void deleteUser(int idVal) {
    try {
      for (var service in services) {
        if (service['gestinnaireIdVal'] == idVal) {
          throw Exception(
            'Ce user est le gestionnaire du service ${service['nomserviceVal']}, il faudrai le remplacer d\'abord',
          );
        }
      }
      categories.removeWhere((item) => item['idVal'] == idVal);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  List<NumeroUrgence> getUrgences() {
    List<NumeroUrgence> liste = [];
    try {
      print('debut de getUrgence depuis data');
      for (Map<String, dynamic> map in urgences) {
          liste.add(NumeroUrgence.fromMap(map));
      }
      return liste;
    } catch (e) {

      throw Exception(e.toString());
    }
  }
}
