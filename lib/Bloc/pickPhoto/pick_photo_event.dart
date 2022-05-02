part of 'pick_photo_bloc.dart';

@immutable
abstract class PickPhotoEvent {}

class GetImage extends PickPhotoEvent{
  final File images;

  GetImage(this.images);
}