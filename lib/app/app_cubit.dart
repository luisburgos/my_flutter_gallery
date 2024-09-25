import 'package:bloc/bloc.dart';
import 'package:my_flutter_gallery/app/app_data.dart';

class MyFlutterGalleryCubit extends Cubit<MyFlutterGalleryData> {
  MyFlutterGalleryCubit(super.initialData);

  /*void setSelectedAppById(String appId) {
    final currentApps = state.items;
    final find = currentApps.where((app) => app.id == appId).firstOrNull;
    if (find == null) return;
    emit(state.copyWith(selectedItem: find));
  }*/
}
