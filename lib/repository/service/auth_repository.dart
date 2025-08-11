import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindowl/utils/log.dart';

abstract class IAuthRepository {
  String get uid;
  String get email;
  String get displayName;
  bool get isUserConnected;
  Stream<bool> isUserConnectedStream();
  Stream<User?> get userAuthStream;
  bool get isAnonymous;

  Future<void> signOut();
  Future<void> setPersistence();
  Future<bool> logInWithEmailPassword(String email, String pwd);
  Future<bool> registerWithEmailPassword(String email, String pwd);
  Future<void> resetPassword(String email);
  Future<void> updateDisplayName(String name);
  Future<void> updatePassword(String password);
  Future<void> reauthenticateWithPassword(String password);
  Future<void> loginUserAnonymously();
  Future<void> signInWithCredential(AuthCredential credential);
  Future<bool> upgradeAnonymWithEmailPassword(String email, String password);
}

class AuthRepository with MyLog implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  String get uid => _auth.currentUser?.uid ?? '';

  @override
  String get email => _auth.currentUser?.email ?? '';

  @override
  String get displayName => _auth.currentUser?.displayName ?? '';

  @override
  bool get isUserConnected => _auth.currentUser != null;

  @override
  Stream<bool> isUserConnectedStream() =>
      _auth.authStateChanges().map<bool>((event) => event != null);

  @override
  Stream<User?> get userAuthStream => _auth.authStateChanges();

  @override
  bool get isAnonymous => _auth.currentUser?.isAnonymous ?? false;

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      loggy.error('Sign out error: $e');
      rethrow;
    }
  }

  @override
  Future<void> setPersistence() async {
    try {
      await _auth.setPersistence(Persistence.LOCAL);
    } catch (e) {
      loggy.error('Set persistence error: $e');
      rethrow;
    }
  }

  @override
  Future<bool> logInWithEmailPassword(String email, String pwd) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return res.user != null;
    } catch (e) {
      loggy.error('Login error: $e');
      rethrow;
    }
  }

  @override
  Future<bool> registerWithEmailPassword(String email, String pwd) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return res.user != null;
    } catch (e) {
      loggy.error('Register error: $e');
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      loggy.error('Reset password error: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateDisplayName(String name) async {
    if (_auth.currentUser != null) {
      try {
        await _auth.currentUser!.updateDisplayName(name);
      } catch (e) {
        loggy.error('Update display name error: $e');
        rethrow;
      }
    }
  }

  @override
  Future<void> updatePassword(String password) async {
    if (_auth.currentUser != null) {
      try {
        await _auth.currentUser!.updatePassword(password);
      } catch (e) {
        loggy.error('Update password error: $e');
        rethrow;
      }
    }
  }

  @override
  Future<void> reauthenticateWithPassword(String password) async {
    if (_auth.currentUser != null) {
      try {
        final credential = EmailAuthProvider.credential(
          email: _auth.currentUser!.email!,
          password: password,
        );
        await _auth.currentUser!.reauthenticateWithCredential(credential);
      } catch (e) {
        loggy.error('Reauthenticate error: $e');
        rethrow;
      }
    }
  }

  @override
  Future<void> loginUserAnonymously() async {
    final user = _auth.currentUser;

    if (user == null) {
      try {
        await _auth.signInAnonymously();
      } catch (e) {
        loggy.error('Anonymous login error: $e');
        rethrow;
      }
    }
  }

  @override
  Future<void> signInWithCredential(AuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
    } catch (e) {
      loggy.error('Sign in with credential error: $e');
      rethrow;
    }
  }

  @override
  Future<bool> upgradeAnonymWithEmailPassword(
    String email,
    String password,
  ) async {
    final user = _auth.currentUser;
    if (user == null) return false;

    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await _auth.currentUser!.linkWithCredential(credential);
      return true;
    } catch (e) {
      loggy.error('Upgrade anonym account error: $e');
      rethrow;
    }
  }
}
