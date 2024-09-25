import 'package:bloc/bloc.dart';
import 'package:my_flutter_gallery/legacy/clones/brancher/app_builder/app_model.dart';

class AppBuilderCubit extends Cubit<AppModel> {
  AppBuilderCubit() : super(const AppModel());

  void setAppTitle(String _) => emit(
        state.copyWith(appTitle: _),
      );

  void setDescription(String _) => emit(
        state.copyWith(description: _),
      );

  void setAuthorName(String _) => emit(
        state.copyWith(
          createdBy: CreatedBy().copyWith(
            displayName: _,
          ),
        ),
      );
}
