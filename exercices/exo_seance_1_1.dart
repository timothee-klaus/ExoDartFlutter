void main() {
  // Voici les données brutes "sales" reçues d'une fausse API.
  // Consigne : Parcourez cette liste, nettoyez les données et affichez le résumé.
  // Interdiction absolue d'utiliser le point d'exclamation (!)
  
  List<Map<String, dynamic>> catalogueBrut = [
    {'nom': 'MacBook Pro', 'prix': 1500.0, 'stock': 10},
    {'nom': 'Souris Logi', 'prix': null, 'stock': 45}, // Le prix est null
    {'nom': 'Clavier Méca', 'stock': 12},              // Le prix a disparu
    {'prix': 29.99, 'stock': 100},                     // Le nom a disparu
    {'nom': 'Écran 4K', 'prix': 350.0, 'stock': null}, // Le stock est null
  ];

  // À vous de jouer ici ! 
  // ...
}