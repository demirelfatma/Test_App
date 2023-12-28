import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_adi/view/home/model/home_view_model.dart';
import 'package:project_adi/view/home/view/widget/vase_container_row.dart';

// ignore: use_key_in_widget_constructors
class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Card(
            elevation: 5,
            color: const Color.fromARGB(255, 26, 50, 120),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timeline,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Titreşim Analizi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: HomeBody(),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: viewModel.getVibrationData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> data = snapshot.data ?? [];

            List<FlSpot> xSpots = [];
            List<FlSpot> ySpots = [];
            List<FlSpot> zSpots = [];

            for (int i = 0; i < data.length; i++) {
              xSpots.add(FlSpot(i.toDouble(), data[i]['x']));
              ySpots.add(FlSpot(i.toDouble(), data[i]['y']));
              zSpots.add(FlSpot(i.toDouble(), data[i]['z']));
            }

            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VaseContainerRow(
                      x: viewModel.xValue,
                      y: viewModel.yValue,
                      z: viewModel.zValue),
                  const SizedBox(height: 20),
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[200],
                    ),
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          buildLineChartBar(xSpots, Colors.red, 2),
                          buildLineChartBar(ySpots, Colors.blue, 2),
                          buildLineChartBar(zSpots, Colors.green, 2),
                        ],
                        gridData: const FlGridData(show: false),
                        titlesData: const FlTitlesData(show: false),
                        borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.isRecording
                        ? viewModel.stopRecording
                        : viewModel.startRecording,
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      backgroundColor: const Color.fromARGB(255, 88, 0, 143), // Arka plan rengi
                    ),
                    child: Text(
                      viewModel.isRecording ? 'Kaydı Durdur' : 'Kaydı Başlat',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: viewModel.signOut,
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      backgroundColor: Colors.red, // Arka plan rengi
                    ),
                    child: const Text(
                      'Çıkış Yap',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Verileri Sil"),
          content: const Text("Tüm verileri silmek istediğinize emin misiniz? Bu işlem geri alınamaz."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                // Silme işlemini başlat
                viewModel.deleteAllUserVibrationData();
                Navigator.pop(context);
              },
              child: const Text("Sil"),
            ),
          ],
        );
      },
    );
  },
  style: ElevatedButton.styleFrom(
    // ignore: deprecated_member_use
    backgroundColor: Colors.orange, // Buton rengi
  ),
  child: const Text(
    'Tüm Verileri Sil',
    style: TextStyle(color: Colors.white),
  ),
),
                ]);
          }
        }
      },
    );
  }

  LineChartBarData buildLineChartBar(
      List<FlSpot> spots, Color color, double barWidth) {
    return LineChartBarData(
        spots: spots,
        color: color,
        isCurved: true,
        barWidth: 2.5,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
            show: false,
            color: Colors.deepPurple.withOpacity(0.4),
            cutOffY: 10,
            applyCutOffY: false));
  }
}
