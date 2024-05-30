class Recipe {
  final String title;
  final String difficulty;
  final String timer;
  final String imageUrl;

  const Recipe({
    required this.title,
    required this.difficulty,
    required this.timer,
    required this.imageUrl,
  });
}

// final List<Recipe> vegetarianRecipes = [
//   const Recipe(title: "Lentil Soup", difficulty: "Easy", timer: "30min", imageUrl: "https://www.istockphoto.com/photos/lentil-soup"),
//   const Recipe(title: "Veggie Burgers", difficulty: "Medium", timer: "45min", imageUrl: "https://www.istockphoto.com/photos/veggie-burger"),
//   const Recipe(title: "Stir-Fried Tofu with Vegetables", difficulty: "Easy", timer: "20min", imageUrl: "https://www.istockphoto.com/photos/tofu-stir-fry"),
//   const Recipe(title: "Creamy Tomato Pasta with Spinach", difficulty: "Easy", timer: "25min", imageUrl: "https://www.istockphoto.com/photos/tomato-pasta-spinach"),
//   const Recipe(title: "Quinoa Salad with Roasted Vegetables", difficulty: "Easy", timer: "30min", imageUrl: "https://www.istockphoto.com/photos/quinoa-salad"),
//   const Recipe(title: "Vegetable Curry with Chickpeas", difficulty: "Medium", timer: "45min", imageUrl: "https://www.istockphoto.com/photos/vegetable-curry"),
//   const Recipe(title: "Stuffed Bell Peppers with Lentils and Rice", difficulty: "Medium", timer: "1 hour", imageUrl: "https://www.istockphoto.com/photos/stuffed-bell-peppers"),
// ];