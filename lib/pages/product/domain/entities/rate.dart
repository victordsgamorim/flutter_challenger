import 'package:equatable/equatable.dart';

class Rate extends Equatable {
  final double rate;
  final int count;

  const Rate({required this.rate, required this.count});

  @override
  List<Object?> get props => [rate, count];
}