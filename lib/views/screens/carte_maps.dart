import 'package:e_services_niger/controllers/localisation_controller.dart';
import 'package:e_services_niger/controllers/provider_controller.dart';
import 'package:e_services_niger/models/coordonnee.dart';
import 'package:e_services_niger/views/widgets/carte_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarteMaps extends StatefulWidget {
  const CarteMaps({super.key});

  @override
  State<CarteMaps> createState() => _CarteMapsState();
}

class _CarteMapsState extends State<CarteMaps> {
  List<CoordonneeLatLnt> lieuxCategorie = [];

  String filtreSelectionne = 'tous';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LocalisationController>().getCurrentCity();
      context.read<ProviderController>().getCoordonnees();
    });
  }

  void filter(List<CoordonneeLatLnt> liste) {
    setState(() {
      lieuxCategorie = liste;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localisationController =
        context.watch<LocalisationController>();

    final providerController =
        context.watch<ProviderController>();

    final maPosition = localisationController.maPosition;

    final lieux = providerController.coordonnees;

    final List<String> categories = [
      'tous',
      'pharmacie',
      'sante',
      'ecole',
      'mosquee',
      'eglise',
      'ministere',
      'banque',
    ];

    if (maPosition == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rechercher sur la carte',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [

          // ==========================
          // BOUTONS DE FILTRE
          // ==========================
          SizedBox(
            height: 55,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((categorie) {

                return Padding(
                  padding: const EdgeInsets.all(8),

                  child: ChoiceChip(
                    label: Text(categorie),

                    selected:
                        filtreSelectionne == categorie,

                    onSelected: (value) {

                      setState(() {

                        filtreSelectionne = categorie;

                        // Si "tous" est sélectionné
                        if (categorie == 'tous') {

                          lieuxCategorie = lieux;

                        } else {

                          lieuxCategorie = lieux
                              .where(
                                (item) =>
                                    item.categorie == categorie,
                              )
                              .toList();
                        }
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          // ==========================
          // CARTE
          // ==========================
          Expanded(
            child: CarteFilter(
              coordonneesList: (filtreSelectionne == 'tous')? lieux : lieuxCategorie,
              maPosition: maPosition,
            ),
          ),
        ],
      ),
    );
  }
}