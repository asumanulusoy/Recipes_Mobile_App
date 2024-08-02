import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_container.dart';
import 'home_screen.dart';

class MealScreen extends StatefulWidget {
  final String mealType;

  const MealScreen({super.key, required this.mealType});

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  final List<String> _favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getMealTitle(widget.mealType),
          style: GoogleFonts.pacifico(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Önceki ekrana dön
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: _buildRecipeList(widget.mealType, context),
            ),
          ),
        ],
      ),
    );
  }

  String _getMealTitle(String mealType) {
    // Öğün türüne göre başlık döndürür
    if (mealType == 'breakfast') {
      return 'Kahvaltı Tarifleri';
    } else if (mealType == 'lunch') {
      return 'Öğle Yemeği Tarifleri';
    } else if (mealType == 'dinner') {
      return 'Akşam Yemeği Tarifleri';
    } else {
      return 'Tarifler';
    }
  }

  List<Widget> _buildRecipeList(String mealType, BuildContext context) {
    // Öğün türüne göre tarifleri içeren widget listesi oluşturur
    List<Widget> recipes = [];
    if (mealType == 'breakfast') {
      recipes = [
        _buildRecipeItem(
          context,
          'Menemen',
          'lib/assets/menemen.jpeg',
          'Kolay Menemen Tarifi:\n\nMalzemeler:\n- 2 adet domates\n- 2 adet yeşil biber\n- 3 adet yumurta\n- Biraz sıvı yağ\n- Tuz ve karabiber\n\nYapılışı:\n1. Domatesleri ve yeşil biberleri küp küp doğrayın.\n2. Bir tavaya sıvı yağ ekleyin ve ısıtın.\n3. Doğradığınız domates ve yeşil biberleri tavaya ekleyin, birkaç dakika kavurun.\n4. Üzerine tuz ve karabiber ekleyin, karıştırın.\n5. Domates ve biberler yumuşadığında çırpılmış yumurtaları ekleyin.\n6. Yumurtalar pişene kadar karıştırın.\n7. Pişen menemeni servis yapın. Afiyet olsun!',
        ),
        _buildRecipeItem(
          context,
          'Pankek',
          'lib/assets/pankek.png',
          'Kolay Pankek Tarifi:\n\nMalzemeler:\n- 1 su bardağı un\n- 1 su bardağı süt\n- 1 adet yumurta\n- 2 yemek kaşığı şeker\n- 1 tatlı kaşığı kabartma tozu\n- Bir tutam tuz\n- Biraz tereyağı veya sıvı yağ (pişirmek için)\n\nYapılışı:\n1. Un, süt, yumurta, şeker, kabartma tozu ve tuzu bir kaseye alıp iyice karıştırın.\n2. Tavaya az miktarda tereyağı veya sıvı yağ koyun ve ısıtın.\n3. Karışımı kepçe yardımıyla tavaya dökün. Orta ateşte altı kızarana kadar pişirin.\n4. Altı kızardıktan sonra spatula yardımıyla çevirin ve diğer tarafını da kızartın.\n5. Pişen pankekleri servis tabağına alıp istediğiniz şekilde servis yapın. Afiyet olsun!',
        ),
        _buildRecipeItem(
          context,
          'Omlet',
          'lib/assets/omlet.jpeg',
          'Kolay Omlet Tarifi:\n\nMalzemeler:\n- 2 adet yumurta\n- Biraz süt\n- Tuz ve karabiber\n- Biraz tereyağı veya sıvı yağ (pişirmek için)\n\nYapılışı:\n1. Yumurtaları bir kaseye kırın ve çırpın.\n2. Biraz süt ekleyin, tuz ve karabiber ile tatlandırın.\n3. Tavaya biraz tereyağı veya sıvı yağ ekleyin ve ısıtın.\n4. Yumurta karışımını tavaya dökün.\n5. Altı pişene kadar spatula yardımıyla karıştırın.\n6. Pişen omleti servis tabağına alıp istediğiniz şekilde servis yapın. Afiyet olsun!',
        ),
      ];
    } else if (mealType == 'lunch') {
      recipes = [
        _buildRecipeItem(
          context,
          'Tavuklu Salata',
          'lib/assets/salata.jpeg',
          'Malzemeler:\n- 200 gram tavuk göğsü\n- 2 adet domates\n- 1 adet salatalık\n- Yarım demet maydanoz\n- 1 adet limon\n- Zeytinyağı\n- Tuz, karabiber\n\nYapılışı:\n1. Tavuk göğsünü haşlayın ve didikleyin.\n2. Domates, salatalık ve maydanozu doğrayın.\n3. Bir karıştırma kabına tavuk göğsü, domates, salatalık ve maydanozu ekleyin.\n4. Üzerine limon suyu, zeytinyağı, tuz ve karabiber ekleyip karıştırın.\n5. Servis yapın. Afiyet olsun!',
        ),
        _buildRecipeItem(
          context,
          'Karnabahar Graten',
          'lib/assets/karnabahar.jpeg',
          'Malzemeler:\n- 1 adet karnabahar\n- 1 su bardağı rendelenmiş kaşar peyniri\n- 1 su bardağı süt\n- 2 yemek kaşığı un\n- 2 yemek kaşığı tereyağı\n- Tuz, karabiber\n\nYapılışı:\n1. Karnabaharı çiçeklerine ayırın ve haşlayın.\n2. Haşlanmış karnabaharı fırın kabına yerleştirin.\n3. Bir tencerede tereyağını eritin, unu ekleyip kavurun.\n4. Unun rengi dönene kadar kavurduktan sonra sütü ekleyin ve karıştırarak pişirin.\n5. Piştikten sonra tuz ve karabiber ekleyin.\n6. Karnabaharların üzerine sostan dökün, rendelenmiş kaşar peyniri serpin.\n7. Önceden ısıtılmış 180 derece fırında peynirler kızarana kadar pişirin. Afiyet olsun!',
        ),
        _buildRecipeItem(
          context,
          'Mantı',
          'lib/assets/mantı.jpeg',
          'Malzemeler:\n- 500 gram kıyma\n- 1 su bardağı un\n- 1 adet yumurta\n- 1 su bardağı yoğurt\n- 2 diş sarımsak\n- Tereyağı\n- Pul biber, nane\n\nYapılışı:\n1. Kıymayı yoğurun ve küçük köfteler hazırlayın.\n2. Un, yumurta ve biraz su ile hamur yoğurun.\n3. Hamuru açın ve küçük kareler halinde kesin.\n4. Her bir kareye köfte yerleştirin ve kenarlarını birleştirip mantı şekli verin.\n5. Kaynayan suda mantıları haşlayın.\n6. Sarımsaklı yoğurt hazırlayın ve mantıların üzerine dökün.\n7. Üzerine kızdırılmış tereyağında pul biber ve nane ile servis yapın. Afiyet olsun!',
        ),
      ];
    } else if (mealType == 'dinner') {
      recipes = [
        _buildRecipeItem(
          context,
          'Fırında Tavuk',
          'lib/assets/tavuk.jpeg',
          'Malzemeler:\n- 4 adet tavuk but\n- 2 adet patates\n- 2 adet havuç\n- 1 adet soğan\n- 2 diş sarımsak\n- Zeytinyağı\n- Tuz, karabiber, kekik\n\nYapılışı:\n1. Tavuk butlarını yıkayın ve temizleyin.\n2. Patatesleri, havuçları ve soğanı iri iri doğrayın.\n3. Bir fırın kabına tavuk butlarını ve doğranmış sebzeleri yerleştirin.\n4. Üzerine ezilmiş sarımsak, zeytinyağı, tuz, karabiber ve kekik serpin.\n5. Önceden ısıtılmış 200 derece fırında yaklaşık 45 dakika pişirin. Afiyet olsun!',
        ),
        _buildRecipeItem(
          context,
          'Köfte',
          'lib/assets/kofte.jpeg',
          'Malzemeler:\n- 500 gram kıyma\n- 1 adet soğan\n- 1 su bardağı galeta unu\n- 1 adet yumurta\n- Tuz, karabiber, pul biber\n- Sıvı yağ\n\nYapılışı:\n1. Kıymayı bir kaseye alın.\n2. Soğanı rendeleyip kıymaya ekleyin.\n3. Galeta unu, yumurta ve baharatları da ekleyip yoğurun.\n4. Yoğrulan kıymadan cevizden biraz büyük parçalar koparıp yuvarlayarak köfte şekli verin.\n5. Tavaya sıvı yağ koyup köfteleri kızartın. Afiyet olsun!',
        ),
        _buildRecipeItem(
          context,
          'Sebzeli Makarna',
          'lib/assets/makarna.jpeg',
          'Malzemeler:\n- 250 gram makarna\n- 1 adet kabak\n- 1 adet havuç\n- 1 adet kırmızı biber\n- 1 adet yeşil biber\n- 2 diş sarımsak\n- Zeytinyağı\n- Tuz, karabiber\n\nYapılışı:\n1. Makarnayı haşlayın ve süzün.\n2. Kabak, havuç, biberleri doğrayın.\n3. Bir tavada zeytinyağında sarımsakları kavurun.\n4. Doğranmış sebzeleri ekleyip kavurun.\n5. Haşlanmış makarnayı sebzelerin üzerine ekleyin.\n6. Tuz ve karabiber ekleyip karıştırın. Afiyet olsun!',
        ),
      ];
    }
    return recipes;
  }

  Widget _buildRecipeItem(
    BuildContext context,
    String title,
    String imagePath,
    String recipe,
  ) {
    final isFavorite = _favoriteRecipes.contains(title);

    return GestureDetector(
      onTap: () {
        _showRecipeDialog(context, title, recipe);
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyContainer(
                  content: title,
                  imagePath: imagePath,
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  _toggleFavorite(title);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _toggleFavorite(String recipeTitle) {
    setState(() {
      if (_favoriteRecipes.contains(recipeTitle)) {
        _favoriteRecipes.remove(recipeTitle);
      } else {
        _favoriteRecipes.add(recipeTitle);
      }
    });
  }

  void _showRecipeDialog(BuildContext context, String title, String recipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(recipe),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
