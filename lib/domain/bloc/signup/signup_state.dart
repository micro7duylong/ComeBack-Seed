//Define the Sign Up state
class SignUpState {
  final String? name;
  final String? phoneNumber;
  final String? address;

  SignUpState({
    this.name,
    this.phoneNumber,
    this.address,
  });

  SignUpState copyWith({
    String? name,
    String? phoneNumber,
    String? address,
  }) {
    return SignUpState(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }
}

class SignUpInitial extends SignUpState {}