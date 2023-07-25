// ignore_for_file: constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed.freezed.dart';
part 'seed.g.dart';

enum BBNetwork { Testnet, Mainnet }

// {
//   network_fingerprint: Seed,
// }
@freezed
class Seed with _$Seed {
  const factory Seed({
    @Default('') String mnemonic,
    @Default('') String mnemonicFingerprint,
    required BBNetwork network,
    required List<Passphrase> passphrases,
  }) = _Seed;
  const Seed._();

  factory Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);

  String getSeedStorageString() {
    return mnemonicFingerprint;
  }

  List<String> mnemonicList() {
    return mnemonic.split(' ');
  }
}

@freezed
class Passphrase with _$Passphrase {
  const factory Passphrase({
    @Default('') String passphrase,
    required String sourceFingerprint,
  }) = _Passphrase;
  const Passphrase._();

  factory Passphrase.fromJson(Map<String, dynamic> json) => _$PassphraseFromJson(json);
}
