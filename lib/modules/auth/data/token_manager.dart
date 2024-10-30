
import 'package:myapp/modules/auth/data/auth_model.dart';

class TokenManager {
  // Priority queue to track token expiration
  final PriorityQueue<OAuthToken> _tokenQueue =
      PriorityQueue<OAuthToken>((a, b) => a.expiresAt.compareTo(b.expiresAt));

  // Store token and add to the priority queue
  void storeToken(OAuthToken token) {
    _tokenQueue.add(token);
  }

  // Fetch the token that will expire soonest for refresh purposes
  OAuthToken? getNextExpiringToken() {
    return _tokenQueue.isNotEmpty ? _tokenQueue.first : null;
  }

  // Clear all tokens (on logout or session expiry)
  Future<void> clearTokens() async {
    _tokenQueue.clear();
  }
}
