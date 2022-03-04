import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/user/user_model.dart';

/// Repository class used for the authentication process
class AuthenticationRepository extends BaseRepository {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  /// Location of user profiles are stored on the database.
  static const String _profilesTable = "user_profiles";
  CollectionReference get _collection => getCollection(_profilesTable);

  /// Stream controller used to create a stream through which profile data is made available.
  final StreamController<UserModel?> _profileStreamCtrl;

  /// Public stream to make the [UserModel] stream accesible outside class, while the controller private.
  Stream<UserModel?> get profileStream => _profileStreamCtrl.stream;

  /// Stream subscription for [FirebaseAuth.authStateChanges].
  late StreamSubscription<User?> _authStateSub;

  /// Stream subscription for the user's document in Cloud Firestore.
  StreamSubscription<DocumentSnapshot<Object?>>? _profileSub;

  /// Object used to create profile.
  UserModel? _newUser;

  GoogleSignIn? __googleSignIn;

  GoogleSignIn get _googleSignIn => __googleSignIn ??= GoogleSignIn();

  AuthenticationRepository() : _profileStreamCtrl = StreamController.broadcast() {
    _authStateSub = _auth.authStateChanges().listen(_startProfileStream);
  }

  /// Register's new user.
  Future<OperationResult> registerUser(UserModel user) async {
    OperationResult result = const OperationResult.success();
    try {
      _newUser = user;
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _newUser!.email!,
        password: _newUser!.password!,
      );
      await userCredential.user!.sendEmailVerification();
    } catch (e, stackTrace) {
      logException("Exception in registerUser", error: e, stackTrace: stackTrace);
      result = const OperationResult.failure("Unkown error when registering user!");
    }
    return result;
  }

  /// Sign in the user using e-mail + password.
  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    OperationResult? result;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      logException("Exception in signInUser", error: e, stackTrace: e.stackTrace);
      result = const OperationResult.failure("Unkown error when signing in user!");
    } catch (e, stackTrace) {
      logException("Exception in signInUser", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("unkown_error".tr());
    }
    if (result != null) {
      addResultToStream(result);
    }
  }

  Future<void> signInWithGoogle() async {
    OperationResult? result;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User user = (await _auth.signInWithCredential(credential)).user!;
      if (!user.emailVerified) await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      logException("Exception in signInWithGoogle", error: e, stackTrace: e.stackTrace);
      result = OperationResult.failure(e.code.tr());
    } catch (e, stackTrace) {
      logException("Exception in signInWithGoogle", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("unkown_error".tr());
    }
    if (result != null) {
      addResultToStream(result);
    }
  }

  /// Sign out the user.
  ///
  /// Besides signing out the user, we need to unsubscribe from [_profileSub].
  Future<void> signOut() async {
    OperationResult? result;
    try {
      _profileSub?.cancel();
      await _auth.signOut();
      final bool isGLoggedIn = await _googleSignIn.isSignedIn();
      if (isGLoggedIn) await _googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      logException("Exception in signOut", error: e, stackTrace: e.stackTrace);
      result = OperationResult.failure("sign_out_error".tr());
    } catch (e, stackTrace) {
      logException("Exception in signOut", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("unkown_error".tr());
    }
    if (result != null) {
      addResultToStream(result);
    }
  }

  Future<void> _addUser(UserModel model) async {
    OperationResult? result;
    try {
      logDebug("Adding user: $model");
      await _collection.add(model);
      logDebug("User added successfully!");
    } on FirebaseException catch (error) {
      logException("Exception in _addUser", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("add_user_profile_error".tr());
    } catch (e, stackTrace) {
      logException("Exception in _addUser", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("unkown_error".tr());
    }
    if (result != null) {
      addResultToStream(result);
    }
  }

  Future<void> _startProfileStream([User? authUser]) async {
    if (authUser == null) {
      _profileStreamCtrl.add(null);
      await _auth.signInAnonymously();
    } else if (authUser.isAnonymous) {
      _profileStreamCtrl.add(UserModel.fromAuth(authUser));
    } else {
      _profileSub?.cancel();
      _profileSub = _collection.doc(authUser.uid).snapshots().listen((doc) {
        if (!doc.exists) {
          _addUser(_newUser?.copyWith(id: authUser.uid) ?? UserModel.fromAuth(authUser));
        } else {
          _profileStreamCtrl.add(UserModel.fromJson(mapFromObject(doc.data())).copyWith(
            emailVerified: authUser.email,
          ));
        }
      });
    }
  }

  Future<void> sendEmailVerification() async {
    OperationResult<String> result = OperationResult.success("sent_email_verification".tr());
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseException catch (e) {
      logException("Exception in sendEmailVerification", error: e, stackTrace: e.stackTrace);
      result = OperationResult.failure(e.code.tr());
    } catch (e, stackTrace) {
      logException("Exception in sendEmailVerification", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("unkown_error".tr());
    }
    addResultToStream(result);
  }

  Future<void> sendPasswordReset(String email) async {
    OperationResult<String> result = OperationResult.success("sent_password_reset".tr());
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      logException("Exception in sendPasswordReset", error: e, stackTrace: e.stackTrace);
      result = OperationResult.failure(e.code.tr());
    } catch (e, stackTrace) {
      logException("Exception in sendPasswordReset", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("unkown_error".tr());
    }
    addResultToStream(result);
  }

  /// Close all stream controllers.
  @override
  Future<void> close() async {
    await _authStateSub.cancel();
    await _profileSub?.cancel();
    await _profileStreamCtrl.close();
    super.close();
  }
}
