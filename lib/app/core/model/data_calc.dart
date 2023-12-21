// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamshear/app/core/ui/helpers/enums.dart';

class DataCalc {
  final double? bf;
  final double? h;
  final double? bw;
  final double? c;
  final double? d;
  final double? q;
  final double? l;
  final double? x;
  final double? vsk;
  final double? vsd;
  final double? vrd2;
  final double? vsw;
  final double? vc;
  final double? asw90;
  final double? aswmin;
  final SteelType? steel;
  final GaugeDiameter? gaugeDiameter;
  final double? smax;
  final double? fck;
  final LoadType? loadType;
  final double? stirrupAngle;
  final GaugeDiameter? diameter;
  final double? nbars;
  final double? ch;
  final double? cv;
  final double? ct;
  final double? spacing;
  DataCalc({
    // this.bf,
    this.bf,
    this.h,
    this.bw,
    this.c,
    this.d,
    this.q,
    this.l,
    this.x,
    this.vsk,
    this.vsd,
    this.vrd2,
    this.vsw,
    this.vc,
    this.asw90,
    this.aswmin,
    this.steel,
    this.gaugeDiameter,
    this.smax,
    this.fck,
    this.loadType,
    this.stirrupAngle,
    this.diameter,
    this.nbars,
    this.ch,
    this.cv,
    this.ct,
    this.spacing,
  });

  factory DataCalc.mock() {
    return DataCalc(
      h: 0.50,
      // bf: 240,
      bw: 0.14,
      c: 2.5,
      d: 0.46,
      vsk: 125,
      fck: 25,
      loadType: LoadType.cortante,
      steel: SteelType.ca50,
      stirrupAngle: 30,
    );
  }

  DataCalc copyWith({
    double? bf,
    double? h,
    double? bw,
    double? c,
    double? d,
    double? q,
    double? l,
    double? x,
    double? vsk,
    double? vsd,
    double? vrd2,
    double? vsw,
    double? vc,
    double? asw90,
    double? aswmin,
    SteelType? steel,
    GaugeDiameter? gaugeDiameter,
    double? smax,
    double? fck,
    LoadType? loadType,
    double? stirrupAngle,
    GaugeDiameter? diameter,
    double? nbars,
    double? ch,
    double? cv,
    double? ct,
    double? spacing,
  }) {
    return DataCalc(
      bf: bf ?? this.bf,
      h: h ?? this.h,
      bw: bw ?? this.bw,
      c: c ?? this.c,
      d: d ?? this.d,
      q: q ?? this.q,
      l: l ?? this.l,
      x: x ?? this.x,
      vsk: vsk ?? this.vsk,
      vsd: vsd ?? this.vsd,
      vrd2: vrd2 ?? this.vrd2,
      vsw: vsw ?? this.vsw,
      vc: vc ?? this.vc,
      asw90: asw90 ?? this.asw90,
      aswmin: aswmin ?? this.aswmin,
      steel: steel ?? this.steel,
      gaugeDiameter: gaugeDiameter ?? this.gaugeDiameter,
      smax: smax ?? this.smax,
      fck: fck ?? this.fck,
      loadType: loadType ?? this.loadType,
      stirrupAngle: stirrupAngle ?? this.stirrupAngle,
      diameter: diameter ?? this.diameter,
      nbars: nbars ?? this.nbars,
      ch: ch ?? this.ch,
      cv: cv ?? this.cv,
      ct: ct ?? this.ct,
      spacing: spacing ?? this.spacing,
    );
  }
}
