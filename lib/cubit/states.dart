import 'package:equatable/equatable.dart';
import 'package:flutter_cubit/models/data_model.dart';

abstract class AppStates extends Equatable {} //no content

class InitialState extends AppStates {
  ///
  ///states hold data >> that's a list of data can be passed
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends AppStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends AppStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedSuccessfullyState extends AppStates {
  ///states grab data
  ///
  final List<DataModel> places;

  LoadedSuccessfullyState(this.places); //1.grabbed

  @override
  // TODO: implement props
  List<Object?> get props => [places]; //2.pass to UI through state.places
}

class DetailsState extends AppStates {
  ///states grab data
  ///
  final DataModel place;

  DetailsState(this.place); //1.grabbed

  @override
  // TODO: implement props
  List<Object?> get props => [place]; //2.pass to UI through state.places
}

// class FavoriteState extends AppStates {
//   final isFavorite;

//   final DataModel place;

//   FavoriteState(this.place, this.isFavorite); //1.grabbed

//   @override
//   // TODO: implement props
//   List<Object?> get props =>
//       [place, isFavorite]; //2.pass to UI through state.places
// }
