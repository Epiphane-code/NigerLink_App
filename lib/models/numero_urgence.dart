class NumeroUrgence {
  final int idVal;
  final String nomserviceVal;
  final String telephoneVal;
  final String descriptionVal;
  final String? couleur;
  NumeroUrgence({
    required this.idVal,
    required this.nomserviceVal,
    required this.telephoneVal,
    required this.descriptionVal,
    required this.couleur,
  });

  factory NumeroUrgence.fromMap(Map<String, dynamic> map) {
    print('conversion');
    final NumeroUrgence urgence = NumeroUrgence(
      idVal: map['idVal'],
      nomserviceVal: map['nomserviceVal'],
      telephoneVal: map['telephoneVal'],
      descriptionVal: map['descriptionVal'],
      couleur: (map['couleur'] == null || (map['couleur']).trim() == '')? 'gray' : map['couleur'],
    );
    print('fin conversion');


    return urgence;
  }
}
