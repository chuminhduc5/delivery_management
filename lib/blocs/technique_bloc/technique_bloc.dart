import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/technique.dart';
import '../../service/technique_service.dart';

part 'technique_event.dart';
part 'technique_state.dart';

class TechniqueBloc extends Bloc<TechniqueEvent, TechniqueState> {
  final TechniqueService techniqueService;

  TechniqueBloc(this.techniqueService) : super(TechniqueInitial()) {
    on<TechniqueFetchRequested>(_onTechniqueFetchRequested);
  }

  Future<void> _onTechniqueFetchRequested(TechniqueFetchRequested event, Emitter<TechniqueState> emit) async {
    emit(TechniqueLoading());
    try {
      final List<Technique> items = await techniqueService.fetchTechnique();
      emit(TechniqueSuccess(data: items));
    } catch (e){
      emit(TechniqueFailed(message: e.toString()));
    }
  }
}
