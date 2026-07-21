 void main() {
   
  // NOTRE CATALOGUE
   

  final List<Map<String, dynamic>> catalogue = [
    {
      'nom': 'MacBook Pro',
      'prix': 1500,
      'categorie': 'Informatique',
      'stock': 5,
    },
    {
      'nom': 'Souris sans fil',
      'prix': 25,
      'categorie': 'Informatique',
      'stock': 0,
    },
    {
      'nom': 'Café en grain',
      'prix': 15,
      'categorie': 'Alimentation',
      'stock': 50,
    },
    {
      'nom': 'Clavier Méca',
      'prix': 80,
      'categorie': 'Informatique',
      'stock': 12,
    },
    {
      'nom': 'Thé vert',
      'prix': 15,
      'categorie': 'Alimentation',
      'stock': 0,
    },
    {
      'nom': 'Écran 4K',
      'prix': 350,
      'categorie': 'Informatique',
      'stock': 3,
    },
  ];

   
  // Produits en rupture de stock
   
  final produitsSansStock = catalogue.where((produit) {
    return produit['stock'] == 0;
  });

  final nomsSansStock = produitsSansStock.map((produit) {
    return produit['nom'];
  }).toList();

  print(nomsSansStock);

   

  //  Tous les noms en MAJUSCULES
  

  final nomsMajuscules = catalogue.map((produit) {
    String nom = produit['nom'];

    return nom.toUpperCase();
  }).toList();

  print(nomsMajuscules);

   
  //  Les trois produits les plus chers
 

  final copie = catalogue.toList();

   

  copie.sort((a, b) {
    int prixA = a['prix'];
    int prixB = b['prix'];

    return prixB.compareTo(prixA);
  });

  

  final troisPlusChers = copie.take(3).map((produit) {
    return produit['nom'];
  }).toList();

  print(troisPlusChers);
 
  // Stock par catégorie
  
  final stockCategorie = catalogue.fold<Map<String, int>>(
    {},
    (resultat, produit) {
      String categorie = produit['categorie'];

      int stock = produit['stock'];

      

      int ancienStock = resultat[categorie] ?? 0;

      resultat[categorie] = ancienStock + stock;

      return resultat;
    },
  );

  print(stockCategorie);

  

  final classement = catalogue.toList();

  classement.sort((a, b) {
    int prixA = a['prix'];

    int prixB = b['prix'];

     
    int comparaison = prixB.compareTo(prixA);

     
    if (comparaison != 0) {
      return comparaison;
    }

    

    String nomA = a['nom'];

    String nomB = b['nom'];

    return nomA.compareTo(nomB);
  });

  print("\nClassement :");

  classement.forEach((produit) {
    print("${produit['nom']} - ${produit['prix']} €");
  });
}