class Ingredient {
  final String ingredient;

  const Ingredient(this.ingredient);

  String get amount => ingredient.split(' ')[0];

  String get item => ingredient.split(' ').skip(1).join(' ');
}
