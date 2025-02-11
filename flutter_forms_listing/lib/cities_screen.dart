import 'package:flutter/material.dart';
import 'city_detail_screen.dart';

class CitiesScreen extends StatelessWidget {
  final String username;
  CitiesScreen({required this.username});

  final List<Map<String, String>> cities = [
    {
      "name": "Delhi",
      "country": "India",
      "population": "19 million",
      "image": "assets/delhi.jpg",
      "description": "Delhi, the capital city of India, is a vibrant metropolis known for its rich history, diverse culture, and bustling markets. The city is home to iconic landmarks such as the Red Fort, India Gate, and Qutub Minar. Old Delhi offers a glimpse into India's Mughal past, while New Delhi showcases grand colonial architecture. The city is also a hub for politics, commerce, and street food, with delicious treats like butter chicken and chaat."
    },
    {
      "name": "London",
      "country": "Britain",
      "population": "8 million",
      "image": "assets/london.jpg",
      "description": "London, the capital of the United Kingdom, is a global city known for its rich history, cultural diversity, and architectural marvels. Famous landmarks include Buckingham Palace, the Tower of London, and Big Ben. The city is a hub for finance, arts, and entertainment, with West End theaters, world-class museums, and a thriving nightlife. Visitors enjoy taking a ride on the London Eye and exploring the charming streets of Covent Garden."
    },
    {
      "name": "Vancouver",
      "country": "Canada",
      "population": "2.4 million",
      "image": "assets/vancouver.jpg",
      "description": "Vancouver, a coastal city in British Columbia, Canada, is renowned for its stunning natural beauty. Surrounded by mountains and the Pacific Ocean, Vancouver offers a mix of urban sophistication and outdoor adventure. The city is known for its mild climate, diverse population, and vibrant arts scene. Stanley Park, Granville Island, and Capilano Suspension Bridge are must-visit attractions. It's also a gateway to Whistler and the Canadian Rockies."
    },
    {
      "name": "New York",
      "country": "USA",
      "population": "8.1 million",
      "image": "assets/new_york.jpg",
      "description": "New York City, often called the 'Big Apple,' is one of the most iconic cities in the world. Known for its towering skyscrapers, including the Empire State Building, and the bright lights of Times Square, NYC is a cultural and economic powerhouse. The city offers endless entertainment, from Broadway shows to world-class museums like the Met. Central Park provides a green escape, while neighborhoods like Brooklyn and Harlem showcase the city's diversity."
    },
    {
      "name": "Astana",
      "country": "Kazakhstan",
      "population": "1.3 million",
      "image": "assets/astana.jpg",
      "description": "Astana, the capital of Kazakhstan, is a futuristic city known for its impressive modern architecture and rapid development. Originally called Akmolinsk, then renamed Nur-Sultan in 2019, it was reverted to Astana in 2022. The city boasts landmarks like the Bayterek Tower, the Khan Shatyr Entertainment Center, and the Nur-Astana Mosque. Astana experiences extreme temperatures, from cold winters to warm summers, and serves as the political and economic hub of Kazakhstan."
    },
    {
      "name": "Tokyo",
      "country": "Japan",
      "population": "14 million",
      "image": "assets/tokyo.jpg",
      "description": "Tokyo, the capital of Japan, is a mesmerizing blend of ultra-modern technology and deep-rooted traditions. The city boasts stunning skyscrapers, vibrant shopping districts, and a thriving food scene, with sushi, ramen, and tempura being local favorites. Tokyo also has historic temples like Senso-ji and scenic parks like Shinjuku Gyoen. Visitors can explore the electric streets of Akihabara, the bustling markets of Tsukiji, and the serene Meiji Shrine."
    },
    {
      "name": "Paris",
      "country": "France",
      "population": "11 million",
      "image": "assets/paris.jpg",
      "description": "Paris, the 'City of Love,' is renowned for its romantic atmosphere, world-class art, and historic landmarks. The Eiffel Tower, Louvre Museum, and Notre-Dame Cathedral are just a few of the must-see attractions. Paris is also known for its charming cafés, elegant fashion scene, and delicious pastries like croissants and macarons. Strolling along the Seine River or exploring the artistic streets of Montmartre offers an unforgettable experience."
    },
    {
      "name": "Sydney",
      "country": "Australia",
      "population": "5.3 million",
      "image": "assets/sydney.jpg",
      "description": "Sydney, Australia's largest city, is famous for its stunning harbor, the Sydney Opera House, and the Harbour Bridge. The city has beautiful beaches, including Bondi and Manly, which attract surfers and tourists year-round. Sydney also offers a lively cultural scene with theaters, museums, and outdoor events. The Royal Botanic Gardens and Blue Mountains provide incredible natural escapes just outside the city."
    },
    {
      "name": "Dubai",
      "country": "UAE",
      "population": "3.3 million",
      "image": "assets/dubai.jpg",
      "description": "Dubai is a dazzling city in the United Arab Emirates known for its futuristic skyline, luxury shopping, and desert landscapes. Home to the Burj Khalifa, the world's tallest building, Dubai offers an unmatched mix of modernity and tradition. Visitors can explore extravagant malls, ride camels in the desert, or experience the vibrant nightlife. The artificial Palm Islands and Dubai Marina are architectural marvels that define the city's grandeur."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("¡Hola $username!"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Hero(
                tag: cities[index]['name']!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cities[index]['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported, size: 60, color: Colors.grey);
                    },
                  ),
                ),
              ),
              title: Text(cities[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${cities[index]['country']} \nPopulation: ${cities[index]['population']}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CityDetailScreen(
                      cityName: cities[index]['name']!,
                      description: cities[index]['description']!,
                      imagePath: cities[index]['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
