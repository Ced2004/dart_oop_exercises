
class Jeepney {
  String routeName;
  String plateNumber;
  int passengerCapacity;
  
  double _collectedFare = 0.0;

  Jeepney({
    required this.routeName,
    required this.plateNumber,
    required this.passengerCapacity,
  });

  double get totalFare => _collectedFare;

  void boardPassengers(int count, double farePerHead) {
    if (count > passengerCapacity) {
      print('Warning: Cannot board $count passengers. Over capacity!');
      return;
    }
    double totalAdded = count * farePerHead;
    _collectedFare += totalAdded; 
    print('$count passengers boarded $plateNumber ($routeName). Fare collected: ₱${totalAdded.toStringAsFixed(2)}');
  }

  void displayStatus() {
    print('----------------------------------');
    print('Jeepney Plate: $plateNumber');
    print('Route: $routeName');
    print('Capacity: $passengerCapacity passengers');
    print('Total Collected Fare: ₱${_collectedFare.toStringAsFixed(2)}');
    print('----------------------------------');
  }
}

void main() {
  print('=== NTC JEEPNEY FLEET MANAGEMENT SYSTEM ===\n');

  Jeepney jeep1 = Jeepney(
    routeName: 'Quiapo - Espana - SM San Lazaro',
    plateNumber: 'NTC-123',
    passengerCapacity: 18,
  );

  Jeepney jeep2 = Jeepney(
    routeName: 'Cubao - Divisoria',
    plateNumber: 'NTC-999',
    passengerCapacity: 22,
  );

  List<Jeepney> jeepneyFleet = [jeep1, jeep2];

  print('--- SIMULATING DAILY OPERATIONS ---');
  jeep1.boardPassengers(10, 13.00); 
  jeep2.boardPassengers(15, 15.00); 
  jeep1.boardPassengers(5, 13.00);  

  print('\n--- FLEET STATUS SUMMARY (LOOPING THROUGH LIST) ---');
  double fleetTotalEarnings = 0.0;

  for (var jeep in jeepneyFleet) {
    jeep.displayStatus();
    fleetTotalEarnings += jeep.totalFare; 
  }

  print('TOTAL EARNINGS FOR ALL JEEPNEYS: ₱${fleetTotalEarnings.toStringAsFixed(2)}');
  print('============================================');
}
