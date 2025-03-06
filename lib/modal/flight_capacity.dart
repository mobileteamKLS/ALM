class Flight {
  final String origin;
  final String destination;
  final int capacity;
  final String time;
  final String flightNo;

  Flight({
    required this.origin,
    required this.destination,
    required this.capacity,
    required this.time,
    required this.flightNo,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      origin: json['origin'],
      destination: json['destination'],
      capacity: json['capacity'],
      time: json['time'],
      flightNo: json['flightNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'origin': origin,
      'destination': destination,
      'capacity': capacity,
      'time': time,
      'flightNo': flightNo,
    };
  }
}

class CapacityRequest {
  final String airline;
  final String flightNumber;
  final String rfcDate;
  final double expectedRevenue;
  final String currency;
  final String status;
  final String? logoUrl;

  CapacityRequest({
    required this.airline,
    required this.flightNumber,
    required this.rfcDate,
    required this.expectedRevenue,
    this.currency = 'USD',
    required this.status,
    this.logoUrl,
  });

  String get formattedRevenue {
    return '${expectedRevenue.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},'
    )} $currency';
  }
}



class FlightCapacityDetails {
  final String date;
  final double amount;
  final double rate;
  final int weightCurrent;
  final int weightTotal;
  final String unit;
  final String currency;
  final double progress;

  FlightCapacityDetails({
    required this.date,
    required this.amount,
    required this.rate,
    required this.weightCurrent,
    required this.weightTotal,
    required this.unit,
    required this.currency,
    required this.progress,
  });
}