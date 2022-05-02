part of 'pick_photo_bloc.dart';

@immutable
abstract class PickPhotoState {}

class PickPhotoInitial extends PickPhotoState {}

class ImageSet extends PickPhotoState{
  final File images;

  ImageSet(this.images);
}