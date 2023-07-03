import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../keys.dart';
import '../services/network_helper.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(GalleryInitial());

  Future<void> getPhotos() async {
    emit(GalleryLoading());

    List<String> images = [];
    String url =
        "https://api.unsplash.com/photos?per_page=20&client_id=$flickrApiKey";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();
    for (int i = 0; i < 20; i++) {
      images.add(data[i]["urls"]["regular"]);
    }
    emit(ImagesLoaded(images: images));
  }
}
