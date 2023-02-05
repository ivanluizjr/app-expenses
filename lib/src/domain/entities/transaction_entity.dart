import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  const TransactionEntity({
    required this.id,
    required this.date,
    required this.title,
    required this.value,
  });

  factory TransactionEntity.empty() {
    return TransactionEntity(
      id: '',
      date: DateTime.now(),
      title: '',
      value: 0.0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        value,
        date,
      ];
}
