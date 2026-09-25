// ignore_for_file: prefer_final_fields

import 'package:e_services_niger/models/categorie.dart';
import 'package:e_services_niger/models/media.dart';
import 'package:e_services_niger/models/numero_urgence.dart';
import 'package:e_services_niger/models/service.dart';
import 'package:e_services_niger/models/user.dart';
import 'package:e_services_niger/controllers/data_controller.dart';
import 'package:e_services_niger/models/video.dart';
import 'package:e_services_niger/services/auth_service.dart';
import 'package:flutter/material.dart';

enum StatutRequete { initial, isLoading, success, error }

class ProviderController extends ChangeNotifier {
  final AuthService _authService = AuthService();



  final Data data = Data();

  //Statut Requete
  StatutRequete _statutRequete = StatutRequete.initial;
  bool get initial => _statutRequete == StatutRequete.initial;
  bool get isLoading => _statutRequete == StatutRequete.isLoading;
  bool get success => _statutRequete == StatutRequete.success;
  bool get error => _statutRequete == StatutRequete.error;
  String _errorText = '';
  String get errorText => _errorText;

  //autentification
  bool _auth = false;
  bool get auth => _auth;

  //Les Info apres l'authentification
  //--------------------------------
  late int _token;
  late UserModel? _mesInfo;
  UserModel get mesInfo => _mesInfo!;

  List<CategorieModel> _categories = [];
  List<CategorieModel> get categories => _categories;

  List<NumeroUrgence> _urgences = [];
  List<NumeroUrgence> get urgences => _urgences;
  //--------------------------------

  //Les Infos avec mise a jours automatique
  //---------------------------------
  List<ServiceModel> _services = [];
  List<ServiceModel> get services => _services;
  UserModel? _userInfo;

  List<MediaModel> _medias = [];
  List<MediaModel> get medias => _medias;

  List<VideoModel> _videos = [];
  List<VideoModel> get videos => _videos;

  //voids
  Future<void> getCoordonnees() async{
    _errorText = "";
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();

    try{}
    catch()
  }


  Future<void> login(String telephone, String password) async {
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();

    try {
      UserModel userget = data.login(telephone, password);
      _mesInfo = userget;
      _token = userget.idVal!;
      _auth = true;
      _statutRequete = StatutRequete.success;
    } catch (e) {
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
    } finally {
      _statutRequete = StatutRequete.initial;
      notifyListeners();
    }
  }

  Future<void> getCategorie() async {
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try {
      _categories = data.getCategories();
      _statutRequete = StatutRequete.success;
      print('GetCategories reussi');

    } catch (e) {
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
      print('GetService echouer');

    } finally {
      notifyListeners();
    }
  }
  Future<void> getMedia() async {
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try {
      _medias = data.getMedia();
      _statutRequete = StatutRequete.success;
      print('GetInfos reussi');

    } catch (e) {
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
      print('GetInfo echouer');

    } finally {
      notifyListeners();
    }
  }
  Future<void> getServices() async {
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try {
      _services = data.getServices();
      _statutRequete = StatutRequete.success;
      print(_services[0].categorieVal);
      print('GetService reussi');
    } catch (e) {
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
      print('Errrorrr getService');
    } finally {
      notifyListeners();
    }
  }
  Future<void> getUserInfo(int id) async{
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try{
      _userInfo = data.getUser(id, _token);
      _statutRequete = StatutRequete.success;

    }
    catch(e){
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
    }
    finally{
      notifyListeners();
    }

  }
  Future<void> deleteService(int idVal) async{
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try{
      data.deleteService(idVal);
    }
    catch(e){
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
    }
    finally{
      notifyListeners();
    }
  }
  Future<void> deleteUser(int idVal) async{
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try{
      data.deleteUser(idVal);
    }
    catch(e){
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
    }
    finally{
      notifyListeners();
    }
  }

  Future<void> getUrgences()async {
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try {

      _urgences = data.getUrgences();
      _statutRequete = StatutRequete.success;
      print('GetUrgence reussi');
    } catch (e) {
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
      print('GetUrgence echouer ${e.toString()}');

    } finally {
      notifyListeners();
    }

  }

  Future<void> getVideos()async {
    _errorText = '';
    _statutRequete = StatutRequete.isLoading;
    notifyListeners();
    try {

      _videos = data.gestVideos();
      _statutRequete = StatutRequete.success;
      print('GetVideos reussi');
    } catch (e) {
      _errorText = e.toString();
      _statutRequete = StatutRequete.error;
      print('GetVideos echouer ${e.toString()}');

    } finally {
      notifyListeners();
    }

  }
}
