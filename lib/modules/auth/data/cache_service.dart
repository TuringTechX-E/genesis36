class CacheService {
  // Cache for storing user sessions and tokens
  final Map<String, UserSession> _sessionCache = {};

  // Store user session in cache
  void storeSession(UserSession session) {
    _sessionCache[session.token] = session;
  }

  // Retrieve session from cache
  UserSession? getSession(String token) {
    return _sessionCache[token];
  }

  // Clear cache (on logout or token expiry)
  Future<void> clearCache() async {
    _sessionCache.clear();
  }
}
