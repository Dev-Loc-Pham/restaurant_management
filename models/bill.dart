

class Bill{
  int ?id;
  String name;
  double total;
  String arrival;
  String leftover;

  Bill({ this.id,required this.name, required this.total,required this.arrival,required this.leftover});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'total': total,
      'arrival': arrival,
      'leftover':leftover,
    };
  }

  @override
  String toString() {
    return 'Bill{id: $id, name: $name, total: $total, arrival: $arrival, leftover: $leftover}';
  }
}