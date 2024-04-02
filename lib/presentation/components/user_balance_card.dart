import 'package:cryptocurrency_chart_app/presentation/style/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserBalanceCard extends StatelessWidget {
  const UserBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.cardLinearGradient,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Portfolio value",
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "\$47,412.65",
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_drop_up_rounded,
                          color: AppColors.green,
                        ),
                        Text(
                          "\$453.85(+1.6%)",
                          style: TextStyle(
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 100),
                const SizedBox(
                  width: 85,
                  height: 35,
                  child: CryptoPriceGraphic(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 1,
              width: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.dividerLinearGradient,
                ),
              ),
            ),
            const SizedBox(height: 9),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     onPressed: () {},
            //     style: TextButton.styleFrom(
            //       foregroundColor: Colors.grey,
            //       minimumSize: Size.zero,
            //       padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            //     ),
            //     child: const Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text('See All'),
            //         Icon(
            //           Icons.arrow_forward_ios,
            //           size: 15,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (ctx) => ,
                //   ),
                // );
              },
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                height: 25,
                width: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "See All",
                      style: TextStyle(color: AppColors.grey),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CryptoPriceGraphic extends StatelessWidget {
  const CryptoPriceGraphic({
    super.key,
    this.borderData = false,
    this.gridData = false,
    this.titlesData = false,
  });

  final bool? borderData;
  final bool? gridData;
  final bool? titlesData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: borderData, border: Border()),
        titlesData: FlTitlesData(show: titlesData!),
        gridData: FlGridData(show: gridData!),
        lineTouchData:
            const LineTouchData(enabled: false), // нажатие на график отключила
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 9,
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 3),
              const FlSpot(1, 1),
              const FlSpot(2, 4),
              const FlSpot(3, 2),
              const FlSpot(4, 9),
              const FlSpot(5, 3),
              const FlSpot(6, 4),
            ],
            isCurved: true,
            color: const Color(0xFF40BF6A),
            barWidth: 2,
            isStrokeCapRound: false,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                  colors: AppColors.greenLinearGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            dotData: const FlDotData(show: false),
          ),
        ],
      ),
    );
  }
}
