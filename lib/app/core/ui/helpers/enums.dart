enum LoadType {
  distributed('Carga distribuida', 1),
  point('Carga pontual', 2),
  triangular('Carga triangular', 3),
  cortante('Valor da cortante (Vsk)', 4);

  final String name;
  final int value;

  const LoadType(this.name, this.value);

  static LoadType parse(String acronym) {
    return values.firstWhere((s) => s.name == acronym);
  }
}

enum SteelType {
  ca25('CA-25', 25),
  ca50('CA-50', 50),
  ca60('CA-60', 60);

  final String name;
  final double value;

  const SteelType(this.name, this.value);

  static SteelType parse(String acronym) {
    return values.firstWhere((s) => s.name == acronym);
  }
}

enum GaugeDiameter {
  mm5('5 mm', 5 / 10),
  mm63('6.3 mm', 6.3 / 10),
  mm8('8 mm', 8 / 10),
  mm10('10 mm', 10 / 10),
  mm12('12 mm', 12 / 10),
  mm16('16 mm', 16 / 10),
  mm20('20 mm', 20 / 10),
  ;

  final String name;
  final double value;

  const GaugeDiameter(this.name, this.value);

  static GaugeDiameter parse(String acronym) {
    return values.firstWhere((s) => s.name == acronym);
  }
}

enum SectionType {
  rectangular,
  t,
}
