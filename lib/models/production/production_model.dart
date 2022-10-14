import 'package:equatable/equatable.dart';

class ProductionModel extends Equatable {
  final String url;
  final String name;
  final String country;
  final DateTime startDate;
  final DateTime endDate;

  const ProductionModel({
    required this.url,
    required this.startDate,
    required this.endDate,
    this.name = '',
    this.country = '',
  });

  @override
  List<Object> get props {
    return [
      url,
      name,
      country,
      startDate,
      endDate,
    ];
  }

  ProductionModel copyWith({
    String? url,
    String? name,
    String? country,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return ProductionModel(
      url: url ?? this.url,
      name: name ?? this.name,
      country: country ?? this.country,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
