import 'package:flutter/material.dart';
import '../model/foodModel.dart';
import '../page/detailFoodPage.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  String selectedCategory = "Rekomendasi";
  String searchQuery = "";
  List<foodModel> sortedFoodList = [];

  @override
  void initState() {
    super.initState();
    _sortAndFilterFoodList();
  }

  void _sortAndFilterFoodList() {
    setState(() {
      List<foodModel> filteredFoodList = listFood
          .where((food) =>
              food.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
      if (selectedCategory == "Rekomendasi") {
        sortedFoodList = List.from(filteredFoodList)
          ..sort((a, b) => a.id.compareTo(b.id));
      } else if (selectedCategory == "Top Review") {
        sortedFoodList = List.from(filteredFoodList)
          ..sort((a, b) => b.review.compareTo(a.review));
      } else if (selectedCategory == "Top Rating") {
        sortedFoodList = List.from(filteredFoodList)
          ..sort((a, b) => b.rate.compareTo(a.rate));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
              _sortAndFilterFoodList();
            });
          },
          decoration: InputDecoration(
            hintText: "Lagi Mau Mamam Dimana?",
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        toolbarHeight: 80,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryButton("Rekomendasi"),
                _buildCategoryButton("Top Review"),
                _buildCategoryButton("Top Rating"),
              ],
            ),
          ),
          Expanded(
            child: sortedFoodList.isEmpty
                ? Center(
                    child: Text(
                      "Tempat tidak ditemukan",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: sortedFoodList.length,
                    itemBuilder: (context, index) {
                      final food = sortedFoodList[index];
                      return FoodCard(food: food);
                    },
                  ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFEAF8FF),
    );
  }

  Widget _buildCategoryButton(String category) {
    bool isSelected = selectedCategory == category;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = category;
          _sortAndFilterFoodList();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      child: Text(
        category,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class FoodCard extends StatefulWidget {
  final foodModel food;

  FoodCard({required this.food});

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailFoodPage(food: widget.food),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    widget.food.image![0],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.yellow),
                      SizedBox(width: 4),
                      Text(
                        '${widget.food.rate.toStringAsFixed(1)} (${widget.food.review})',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.food.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.food.location,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
