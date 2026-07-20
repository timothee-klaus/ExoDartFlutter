void main() {
  // CONSIGNE SÉANCE 1.2 :
  // À partir d'une liste de produits propres, produis :
  // 1. La liste des produits en rupture de stock.
  // 2. Tous les noms des produits en MAJUSCULES.
  // 3. Les 3 produits les plus chers.
  // 4. Le stock total par catégorie.
  // CONTRAINTE ABSOLUE : Uniquement avec map / where / fold — aucune boucle for !
  // BONUS : Trie le catalogue par prix décroissant, puis par nom en cas d'égalité.

  final List<Map<String, dynamic>>catalogue = [
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
    {'nom': 'Thé vert', 'prix': 15, 'categorie': 'Alimentation', 'stock': 0},
    {'nom': 'Écran 4K', 'prix': 350, 'categorie': 'Informatique', 'stock': 3},
  ];

  // À vous de jouer (sans utiliser le mot 'for' !) :

  // 1. Les ruptures de stock avec where[cite: 3, 4] puis map[cite: 3, 4]
  final ruptures = catalogue
      .where((p) => (p['stock'] as int) == 0)
      .map((p) => p['nom'] as String)
      .toList();
  print('En rupture de stock : $ruptures'); // [Souris sans fil, Thé vert]

  // 2. Les noms en MAJUSCULES avec map[cite: 3, 4]
  final majuscules = catalogue
      .map((p) => (p['nom'] as String).toUpperCase())
      .toList();
  print('Noms en majuscules : $majuscules');

  // 3. Les 3 plus chers en triant une copie avec sort
  final copieTriee = catalogue.toList()
    ..sort((a, b) => (b['prix'] as int).compareTo(a['prix'] as int));
  final troisPlusChers = copieTriee.take(3).map((p) => p['nom']).toList();
  print('Les 3 plus chers : $troisPlusChers'); // [MacBook Pro, Écran 4K, Clavier Méca]

  // 4. Le stock par catégorie avec fold (sans boucle !)
  final stockParCategorie = catalogue.fold<Map<String, int>>({}, (mapAcc, produit) {
    final cat = produit['categorie'] as String;
    final stock = produit['stock'] as int;
    mapAcc[cat] = (mapAcc[cat] ?? 0) + stock;
    return mapAcc;
  });
  print('Stock par catégorie : $stockParCategorie'); // {Informatique: 20, Alimentation: 50}

  // --- BONUS : Tri par prix décroissant, puis par nom en cas d'égalité ---
  print('\n🏆 --- CLASSEMENT BONUS ---');
  catalogue.sort((a, b) {
    final compPrix = (b['prix'] as int).compareTo(a['prix'] as int);
    if (compPrix != 0) return compPrix; // Si prix différents, on garde ce tri
    
    // Si prix égaux (ex: 15€ et 15€), on départage par nom (a contre b)
    return (a['nom'] as String).toLowerCase().compareTo((b['nom'] as String).toLowerCase());
  });

  catalogue.forEach((p) => print(' - ${p['nom']} : ${p['prix']} €'));
}

