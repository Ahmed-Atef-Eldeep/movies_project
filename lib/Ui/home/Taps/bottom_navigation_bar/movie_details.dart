import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = 'movieDetails';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // === Poster with Play Button and Back Button ===
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.55,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.50, -0.00),
                    end: Alignment(0.50, 1.00),
                    colors: [const Color(0x33121312), const Color(0xFF121312)],
                  ),
                  image: DecorationImage(
                    image: AssetImage(AppAssets.actionBG1), // Replace with your actual asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: Icon(Icons.bookmark_border, color: Colors.white),
              ),
              Center(
                heightFactor: 4,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.play_arrow, size: 40, color: Colors.red),
                ),
              ),
            ],
          ),

          // === Movie Info ===
          SizedBox(height: 12),
          Text(
            "Doctor Strange in the Multiverse of Madness",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text("2022", style: TextStyle(color: Colors.grey)),

          // === Watch Button ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Watch", style: TextStyle(fontSize: 16)),
              ),
            ),
          ),

          // === Stats Row ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatItem(icon: Icons.favorite, label: "15"),
                StatItem(icon: Icons.access_time, label: "90"),
                StatItem(icon: Icons.star, label: "7.6"),
              ],
            ),
          ),

          // === Screenshots Section ===
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Screen Shots",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/screenshot1.jpg", width: 150, fit: BoxFit.cover),
                ),
                SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/screenshot2.jpg", width: 150, fit: BoxFit.cover),
                ),
                SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/screenshot3.jpg", width: 150, fit: BoxFit.cover),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Widget for the stats row (likes, time, rating)
class StatItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const StatItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.amber),
          SizedBox(width: 6),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
