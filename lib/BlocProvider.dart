import 'package:rx_demo/messages/MessageBloc.dart';

import 'counter/CounterBloc.dart';

class BlocProvider {
  final CounterBloc _counterBloc = CounterBloc();
  final MessageBloc _messageBloc = MessageBloc();

  CounterBloc get counterBloc => _counterBloc;
  MessageBloc get messageBloc => _messageBloc;
}
