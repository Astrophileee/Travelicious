import 'package:flutter/material.dart';
import '../model/destinationModel.dart';
import 'detailDestinationPage.dart';

class DestinationPage extends StatefulWidget {
  @override
  _DestinationPageState createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  String selectedCategory = "Rekomendasi";
  String searchQuery = "";
  List<destinationModel> sortedDestinationList = [];

  @override
  void initState() {
    super.initState();
    _sortAndFilterDestinationList();
  }

  void _sortAndFilterDestinationList() {
    setState(() {
      List<destinationModel> filteredDestinationList = listDestination
          .where((destination) => destination.name
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
      if (selectedCategory == "Rekomendasi") {
        sortedDestinationList = List.from(filteredDestinationList)
          ..sort((a, b) => a.id.compareTo(b.id));
      } else if (selectedCategory == "Top Review") {
        sortedDestinationList = List.from(filteredDestinationList)
          ..sort((a, b) => b.review.compareTo(a.review));
      } else if (selectedCategory == "Top Rating") {
        sortedDestinationList = List.from(filteredDestinationList)
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
              _sortAndFilterDestinationList();
            });
          },
          decoration: InputDecoration(
            hintText: "Lagi Mau Ke Tempat Gimana?",
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
            child: sortedDestinationList.isEmpty
                ? Center(
                    child: Text(
                      "Destinasi tidak ditemukan",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: sortedDestinationList.length,
                    itemBuilder: (context, index) {
                      final destination = sortedDestinationList[index];
                      return DestinationCard(destination: destination);
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
          _sortAndFilterDestinationList();
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

class DestinationCard extends StatefulWidget {
  final destinationModel destination;

  DestinationCard({required this.destination});

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailDestinationPage(
              destination: widget.destination,
            ),
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
                    widget.destination.image![0],
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
                        '${widget.destination.rate.toStringAsFixed(1)} (${widget.destination.review})',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.destination.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.destination.location,
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
