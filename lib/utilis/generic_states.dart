class GenericStates {
  GenericStates();
  factory GenericStates.genericError(Error error) = GenericErrorState;
  factory GenericStates.connectionError() = ConnectionErrorState;
  factory GenericStates.unauthorizedError() = UnauthorizedErrorState;
  factory GenericStates.accessForbiddenError() = AccessForbiddenErrorState;
  factory GenericStates.unhandledError() = UnhandledErrorState;
}

class GenericErrorState extends GenericStates {
  GenericErrorState(this.error);
  final Error error;
}

class ConnectionErrorState extends GenericErrorState {
  ConnectionErrorState() : super(Error());
}

class UnauthorizedErrorState extends GenericErrorState {
  UnauthorizedErrorState() : super(Error());
}

class AccessForbiddenErrorState extends GenericErrorState {
  AccessForbiddenErrorState() : super(Error());
}

class UnhandledErrorState extends GenericErrorState {
  UnhandledErrorState() : super(Error());
}
