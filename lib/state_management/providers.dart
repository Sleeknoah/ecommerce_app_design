import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider offsetProvider = StateProvider<double>((ref) => 0.0);
StateProvider fadeVisibleProvider = StateProvider<bool>((ref) => false);
