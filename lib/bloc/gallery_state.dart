part of 'gallery_cubit.dart';


//equatable  помогает сравнить 2 объекта и понять тот же это объект или нет


@immutable
abstract class GalleryState extends Equatable{
  const GalleryState();
  // Это нужно для работы состояния
  @override
  List<Object> get props => [];
}

//Это состояние
class GalleryInitial extends GalleryState{
  const GalleryInitial();
}
//Это состояние
class GalleryLoading extends GalleryState{
  const GalleryLoading();
}
//Это состояние
class ImagesLoaded extends GalleryState{
  final List<String> images;
  const ImagesLoaded({required this.images});

  @override
  List<Object> get props => [images];

}
//Это состояние
class GalleryError extends GalleryState{
  final List<String> message;
  const GalleryError({required this.message});

  @override
  List<Object> get props => [message];

}