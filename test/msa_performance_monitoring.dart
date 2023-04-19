import 'package:firebase_performance/firebase_performance.dart';



void main() {
  FirebasePerformance performance = FirebasePerformance.instance;

  Trace trace = performance.newTrace('msa-trace');
}
