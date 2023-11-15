import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'agent_event.dart';
part 'agent_state.dart';

class AgentBloc extends Bloc<AgentEvent, AgentState> {
  AgentBloc() : super(AgentInitial()) {
    on<AgentCreateEvent>(
        _onCreateCard); //Передаём callback на функцию, которую нужно будет вызвать на этот Event
    //  TODO:implement event handler
  }
  _onCreateCard(AgentCreateEvent event, Emitter<AgentState> state) {}
}
