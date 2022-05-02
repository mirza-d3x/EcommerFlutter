import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pick_photo_event.dart';
part 'pick_photo_state.dart';

class PickPhotoBloc extends Bloc<PickPhotoEvent, PickPhotoState> {
  PickPhotoBloc() : super(PickPhotoInitial()) {
    on<PickPhotoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
