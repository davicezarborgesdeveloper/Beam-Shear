// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamshear/app/core/ui/helpers/enums.dart';

class DataCalc {
  final double? bf;
  final double? bw;
  final double? c;
  final double? d;
  final double? q;
  final double? l;
  final double? x;
  final double? v;
  final SteelType? steel;
  final double? fck;
  final LoadType? loadType;
  final double? stirrupAngle;
  DataCalc({
    this.bf,
    this.bw,
    this.c,
    this.d,
    this.q,
    this.l,
    this.x,
    this.v,
    this.steel,
    this.fck,
    this.loadType,
    this.stirrupAngle,
  });

  factory DataCalc.mock() {
    return DataCalc(
      bf: 240,
      bw: 40,
      c: 2.5,
      d: 113,
      q: 300,
      x: 5,
      l: 10,
      fck: 30,
      loadType: LoadType.point,
      steel: SteelType.ca50,
      stirrupAngle: 30,
    );
  }

  DataCalc copyWith({
    double? bf,
    double? bw,
    double? c,
    double? d,
    double? q,
    double? l,
    double? x,
    double? v,
    SteelType? steel,
    double? fck,
    LoadType? loadType,
    double? stirrupAngle,
  }) {
    return DataCalc(
      bf: bf ?? this.bf,
      bw: bw ?? this.bw,
      c: c ?? this.c,
      d: d ?? this.d,
      q: q ?? this.q,
      l: l ?? this.l,
      x: x ?? this.x,
      v: v ?? this.v,
      steel: steel ?? this.steel,
      fck: fck ?? this.fck,
      loadType: loadType ?? this.loadType,
      stirrupAngle: stirrupAngle ?? this.stirrupAngle,
    );
  }
}
