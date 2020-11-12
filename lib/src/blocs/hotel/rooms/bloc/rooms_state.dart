import 'package:equatable/equatable.dart';
import 'package:test_app/src/models/hotel/hotel_rooms.dart';

abstract class RoomsState extends Equatable {
  const RoomsState();

  @override
  List<Object> get props => [];
}

class RoomsInitial extends RoomsState {}

class RoomsInLoading extends RoomsState {}

class RoomsloadedSucees extends RoomsState {
  final List<Findavailableroom> rommsitem;

  const RoomsloadedSucees(this.rommsitem);

    @override
  List<Object> get props => [rommsitem];

    @override
  String toString() => 'SearchStateSuccess { items: ${rommsitem.length} }';

}

class RoomsLoadFailure extends RoomsState {
    final String error;

  const RoomsLoadFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'fetch rooms Failure { error: $error }';

}
