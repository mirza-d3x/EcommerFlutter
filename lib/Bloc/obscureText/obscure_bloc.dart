import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'obscure_event.dart';

part 'obscure_state.dart';

class ObscureBloc extends Bloc<ObscureEvent, ObscureState> {
  ObscureBloc() : super(InitialObscure()) {
    on<obScureTrueFalse>((event, emit) {
      return emit(ObscureState(obscurePass: !state.obscurePass));
    });
  }
}
