import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DonutWidgetChart extends StatelessWidget {
  final int value;
  final int totalValue;

  const DonutWidgetChart({
    super.key,
    required this.value,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: (154 / 375) * width * 1.5,
      height: (154 / 375) * width * 1.5,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 270,
            endAngle: 630,
            minimum: 0,
            maximum: totalValue.toDouble(),
            radiusFactor: 1,
            showLabels: false,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: (20 / 375) * width,
              cornerStyle: CornerStyle.bothFlat,
              color: const Color(0xFFECF6FF),
              thicknessUnit: GaugeSizeUnit.logicalPixel,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: value.toDouble(),
                width: (20 / 375) * width,
                sizeUnit: GaugeSizeUnit.logicalPixel,
                cornerStyle: CornerStyle.bothCurve,
                gradient: const SweepGradient(
                  colors: <Color>[Color(0xFFFBD3EB), Color(0xFFD0EBFF)],
                  stops: <double>[0.25, 0.75],
                ),
              ),
              // MarkerPointer(
              //   value: 80,
              //   markerType: MarkerType.values[20],
              //   color: Color.fromARGB(255, 13, 13, 13),
              //   markerHeight: (14 / 375) * width,
              //   markerWidth: (14 / 375) * width,
              //   borderColor: const Color(0xFFa1d5ff),
              //   borderWidth: (6 / 375) * width,
              // )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.05,
                angle: 90,
                widget: Container(
                  width: (102 / 375) * width,
                  height: (102 / 375) * width,
                  decoration: BoxDecoration(
                    // color: const Color(0xff6bbdff),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.05),
                          offset: const Offset(0, 0),
                          blurRadius: 10.0,
                          spreadRadius: 0)
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "kWh",
                        style: AppFonts.quicksand700(
                          16,
                          AppColors.grey400,
                        ),
                      ),
                      Text(
                        "$value/$totalValue",
                        style: AppFonts.quicksand700(
                          24,
                          AppColors.grey500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
