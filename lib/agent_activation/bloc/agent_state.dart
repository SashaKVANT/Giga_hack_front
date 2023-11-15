part of 'agent_bloc.dart';

@immutable
abstract class AgentState {}

class AgentInitial extends AgentState {}

class AgentCreatedState extends AgentState {}

class AgentCreatingState extends AgentState {}
