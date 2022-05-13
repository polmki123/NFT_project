import 'package:flutter/cupertino.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MetaMaskProvider extends ChangeNotifier {
  // 1. Operating chain no.
  static const operatingChain = 4;

  // 2. Wallet Address
  String? currentAddress;

  // 3. Current chain no.
  int? currentChain;

  // 4. Is Ethereum exists in browser
  bool get isEnabled => ethereum != null;

  // 5. Is Operating chain is same as current chain
  bool get isInOperatingChain => currentChain == operatingChain;

  // 6. Is Metamask connected
  bool get isConnected => isEnabled && currentAddress!.isNotEmpty;

  // 7. Wallet Balance
  String walletBalance = '';

  // 8. Message
  String message = 'Connect your metamask wallet';

  // Initialize the metamask provider
  initializeMetamaskProvider() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accounts) {
        clearAllStateVariables();
      });
      ethereum!.onChainChanged((chainId) {
        clearAllStateVariables();
      });
    } else {
      message = 'Please use a Web3 supported browser';
    }
  }

  // Connect with metamask
  Future connectWithMetamask() async {
    if (isEnabled) {
      final accounts = await ethereum!.requestAccount();

      // If there is no account, then return
      if (accounts.isEmpty) return null;

      // Taking the first account
      currentAddress = accounts.first;

      message = 'Your account is ${currentAddress}.';

      // Setting current chain
      currentChain = await ethereum!.getChainId();

      notifyListeners();
    } else {
      message = 'Please use a Web3 supported browser';
    }
  }

  // Disconnect with metamask
  clearAllStateVariables() {
    currentAddress = null;
    currentChain = null;

    notifyListeners();
  }
}
