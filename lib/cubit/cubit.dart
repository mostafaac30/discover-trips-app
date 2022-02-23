import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/states.dart';
import 'package:flutter_cubit/models/data_model.dart';
import 'package:flutter_cubit/services/data_services.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  emit(InitialState);

  DataServices data = DataServices();
  late final places;

  getData() async {
    emit(LoadingState());
    await data.getDataFromServer().then((value) {
      places = value;

      emit(LoadedSuccessfullyState(places));
    });
  }

  // bool isFavorite = false;

  getDetails(DataModel place) async {
    emit(DetailsState(place));
  }

  goHome() {
    emit(LoadedSuccessfullyState(places));
  }

  makeFavorite(DataModel place) {
    place.isFav = !place.isFav;
    emit(DetailsState(place));
  }

  ///
}
