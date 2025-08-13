import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../model/dashboard_data_model.dart';
import '../dashboardBase/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

ValueNotifier<List<Animal>> animalList = ValueNotifier<List<Animal>>([]);
void navigateToDashboard(BuildContext context){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DashboardScreen()),
  );
}

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomBar({super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 20),
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Black pill-shaped bar
          Positioned.fill(
            child: CustomPaint(
              painter: BubbleBarPainter(),
            ),
          ),

          // Center paw icon
          Positioned(
            bottom: 35,
            child: GestureDetector(
              onTap: () => onItemTapped(1),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Center(
                  child: CircleAvatar(backgroundColor:  selectedIndex == 1 ?  Colors.orange : Colors.transparent,
                      child: const Icon(Icons.pets, size: 24, color: Colors.white)),
                ),
              ),
            ),
          ),

          // Left orange icon
           Positioned(
            left: 30,
            bottom: 8,
            child: Bounceable(
              onTap: () => onItemTapped(0),
              child: CircleAvatar(
                backgroundColor:  selectedIndex == 0 ?  Colors.orange : Colors.transparent,
                child: const Icon(Icons.home, color: Colors.white),
              ),
            ),
          ),

          // Right heart icon
          Positioned(
            bottom: 8,
            right: 30,
            child: GestureDetector(
              onTap: () =>onItemTapped(2),
            child: CircleAvatar(
              backgroundColor:  selectedIndex == 2 ?  Colors.orange : Colors.transparent,
              child:  const Icon(Icons.favorite_border, color:  Colors.white),)
            ),
          ),
        ],
      ),
    );
  }
}

class BubbleBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    final path = Path();

    double radius = height * 0.9;

    // Top curves
    path.moveTo(0, height);
    path.quadraticBezierTo(0, height * 0.3, width * 0.18, height * 0.3);

    path.arcToPoint(Offset(width * 0.36, height * 0.3),
        radius: Radius.circular(radius), clockwise: false);

    path.arcToPoint(Offset(width * 0.64, height * 0.3),
        radius: Radius.circular(radius), clockwise: true);

    path.arcToPoint(Offset(width * 0.82, height * 0.3),
        radius: Radius.circular(radius), clockwise: false);

    path.quadraticBezierTo(width, height * 0.3, width, height);

    // Straight bottom line
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Future<String?> getAccessToken(BuildContext context) async {
  const clientId = 'eP0ShAbKCBiRB1m6wHtH163krvR6idA6y6TUMFh5QlbzcUmQIt';
  const clientSecret = 'oB7s1ZzwQn6OduxVFd72TnkNOeLIIdPnaz5fp3TV';

  final response = await http.post(
    Uri.parse('https://api.petfinder.com/v2/oauth2/token'),
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: {
      'grant_type': 'client_credentials',
      'client_id': clientId,
      'client_secret': clientSecret,
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['access_token'];
  } else {
    ShowMyDialog(context,"Need Internet To fetch list!","Failure");
    return null;
  }
}
Future<void> fetchAnimals(BuildContext context) async {
  final token = await getAccessToken(context);
  if (token == null) {
    ShowMyDialog(context,"Failed to get token","Token Error");
    return;
  }

  final response = await http.get(
    Uri.parse('https://api.petfinder.com/v2/animals'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    animalList.value = parseAnimals(response.body);
  } else {
    ShowMyDialog(context,"Error fetching animals","Api Error");
  }
}
