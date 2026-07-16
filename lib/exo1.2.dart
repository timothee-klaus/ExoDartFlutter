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
  // ...


final List<Map<String,dynamic>> ruptureDeStock= catalogue.where ((produit)=> produit ['stock']==0) .toList();

final List<String> nomMajuscules= catalogue.map((produit)=> (produit ['nom'] as String).toUpperCase()).toList();

final List<Map<String, dynamic>> catalogueTrie = List<Map<String, dynamic>>.from(catalogue)
    ..sort((a, b) {
      final int comparePrix = (b['prix'] as num).compareTo(a['prix'] as num);
      if (comparePrix != 0) return comparePrix; // Si les prix sont différents, on trie par prix
      return (a['nom'] as String).compareTo(b['nom'] as String); // Sinon, par nom (ordre alphabétique)
    });

final List<Map<String, dynamic>> top3PlusChers = catalogueTrie.take(3).toList();

final Map<String, int> stockParCategorie = catalogue.fold<Map<String, int>>({}, (accumulateur, produit) {
    final String categorie = produit['categorie'] as String;
    final int stock = produit['stock'] as int;
    
    // On incrémente ou on initialise à 0 + stock
    accumulateur[categorie] = (accumulateur[categorie] ?? 0) + stock;
    return accumulateur;
  });

// Affichage des résultats dans la console Dart
  print('--- 1. En rupture de stock ---');
  ruptureDeStock.forEach((p) => print('${p['nom']} (${p['categorie']})'));

  print('\n--- 2. Noms en MAJUSCULES ---');
  print(nomMajuscules);

  print('\n--- 3. Top 3 des plus chers (Trié) ---');
  top3PlusChers.forEach((p) => print('${p['nom']} - ${p['prix']}€'));

  print('\n--- 4. Stock total par catégorie ---');
  print(stockParCategorie);
}