class UserModel {
  final String name;
  final String profilePic;
  final String uid;
  final String isAuthenticated;

//<editor-fold desc="Data Methods">
  const UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.isAuthenticated,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          profilePic == other.profilePic &&
          uid == other.uid &&
          isAuthenticated == other.isAuthenticated);

  @override
  int get hashCode =>
      name.hashCode ^
      profilePic.hashCode ^
      uid.hashCode ^
      isAuthenticated.hashCode;

  @override
  String toString() {
    return 'UserModel{ name: $name, profilePic: $profilePic, uid: $uid, isAuthenticated: $isAuthenticated,}';
  }

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
    String? isAuthenticated,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilePic': profilePic,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['uid'] as String,
      isAuthenticated: map['isAuthenticated'] as String,
    );
  }

//</editor-fold>
}
