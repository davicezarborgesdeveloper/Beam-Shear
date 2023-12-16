enum LoadType {
  distributed('Carga distribuida', 1),
  point('Carga pontual', 2),
  triangular('Carga triangular', 3),
  cortante('Valor da cortante (v)', 4);

  final String name;
  final int value;

  const LoadType(this.name, this.value);

  static LoadType parse(String acronym) {
    return values.firstWhere((s) => s.name == acronym);
  }
}

enum SteelType {
  ca25('CA-25', 250 / 1.15),
  ca50('CA-50', 500 / 1.15),
  ca60('CA-60', 600 / 1.15);

  final String name;
  final double value;

  const SteelType(this.name, this.value);

  static SteelType parse(String acronym) {
    return values.firstWhere((s) => s.name == acronym);
  }
}

enum GaugeDiameter {
  mm5('5 mm', 5),
  mm63('6.3 mm', 6.3),
  mm8('8 mm', 8),
  mm10('10 mm', 10),
  mm12('12 mm', 12),
  mm16('16 mm', 16),
  mm20('20 mm', 20),
  ;

  final String name;
  final double value;

  const GaugeDiameter(this.name, this.value);

  static GaugeDiameter parse(String acronym) {
    return values.firstWhere((s) => s.name == acronym);
  }
}
