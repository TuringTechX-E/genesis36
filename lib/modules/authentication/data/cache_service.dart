import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'auth_model.dart';

class CacheService {
  // In-memory cache for user sessions
  final Map<String, UserSession> _sessionCache = {};

  /// Store user session in cache and persist it using SharedPreferences
  Future<void> storeSession(UserSession session) async {
    _sessionCache[session.token] = session;
    await _persistSession(session);
  }

  /// Retrieve session from in-memory cache or persistent storage
  Future<UserSession?> getSession(String token) async {
    // Check in-memory cache first
    if (_sessionCache.containsKey(token)) {
      return _sessionCache[token];
    }

    // Fallback to persistent storage
    return await _retrieveSessionFromStorage(token);
  }

  /// Clear cache (on logout or token expiry)
  Future<void> clearCache() async {
    _sessionCache.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  /// Handles session expiration automatically
  Future<void> removeExpiredSessions() async {
    final currentTime = DateTime.now();
    _sessionCache.removeWhere((key, session) => !session.isValid);

    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (var key in keys) {
      final sessionJson = prefs.getString(key);
      if (sessionJson != null) {
        final session = UserSession.fromJson(jsonDecode(sessionJson));
        if (session.expiration != null && currentTime.isAfter(session.expiration!)) {
          await prefs.remove(key);
        }
      }
    }
  }

  /// Persist user session using SharedPreferences
  Future<void> _persistSession(UserSession session) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(session.token, jsonEncode(session.toJson()));
  }

  /// Retrieve session from persistent storage
  Future<UserSession?> _retrieveSessionFromStorage(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final sessionJson = prefs.getString(token);
    if (sessionJson == null) return null;

    try {
      final sessionData = jsonDecode(sessionJson);
      return UserSession.fromJson(sessionData);
    } catch (e) {
      print('Error decoding session data: $e');
      return null;
    }
  }
}
