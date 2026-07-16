void main() {
  // CONSIGNE SÉANCE 1.2 :
  // À partir d'une liste de produits propres, produis :
  // 1. La liste des produits en rupture de stock.
  // 2. Tous les noms des produits en MAJUSCULES.
  // 3. Les 3 produits les plus chers.
  // 4. Le stock total par catégorie.
  // CONTRAINTE ABSOLUE : Uniquement avec map / where / fold — aucune boucle for !
  // BONUS : Trie le catalogue par prix décroissant, puis par nom en cas d'égalité.

  final catalogue = [
    {'nom': 'MacBook Pro', 'prix': 1500, 'categorie': 'Informatique', 'stock': 5},
    {'nom': 'Souris sans fil', 'prix': 25, 'categorie': 'Informatique', 'stock': 0},
    {'nom': 'Café en grain', 'prix': 15, 'categorie': 'Alimentation', 'stock': 50},
    {'nom': 'Clavier Méca', 'prix': 80, 'categorie': 'Informatique', 'stock': 12},
    {'nom': 'Thé vert', 'prix': 15, 'categorie': 'Alimentation', 'stock': 0},
    {'nom': 'Écran 4K', 'prix': 350, 'categorie': 'Informatique', 'stock': 3},
  ];

  // À vous de jouer (sans utiliser le mot 'for' !) :
  //1
  final produitsRuptureStock = catalogue.where((p) => p['stock'] == 0).toList();
  print('Produits en rupture de stock : $produitsRuptureStock');
  //2
  final nomsMajuscules = catalogue.map((p) => p['nom'].toString().toUpperCase()).toList();
  print('Noms des produits en MAJUSCULES : $nomsMajuscules');
  //3
  final produitsPlusChers = catalogue..sort((a, b) => (b['prix'] as int).compareTo(a['prix'] as int));
  final troisProduitsPlusChers = produitsPlusChers.take(3).toList();
  print('Les 3 produits les plus chers : $troisProduitsPlusChers');
  //4
  final stockTotalPCat = catalogue.fold<Map<String, int>>({}, (acc, p) {
    final cat = p['categorie'].toString();
    acc[cat] = (acc[cat] ?? 0) + (p['stock'] as int);
    return acc;
  });  
  // ...
}