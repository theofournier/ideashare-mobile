const functions = require("firebase-functions");
const admin = require("firebase-admin");

const Helpers = require("./helpers");
const Constants = require("./constants");

admin.initializeApp();

// AUTH TRIGGERS
/*
exports.userOnCreate = functions.auth.user().onCreate((firebaseUser) => {
  console.log("Create User Document");

  const name = Helpers.getNameFromDisplayName(firebaseUser.displayName);

  const user = {
    firstName: name.firstName,
    lastName: name.lastName,
    photoUrl: firebaseUser.photoURL,
    email: firebaseUser.email,
    privacy: Constants.Privacy.public,
    followed: Constants.Visibility.everyone,
    ideasCount: 0,
    issuesCount: 0,
    postViewsCount: 0,
    postLikesCount: 0,
    postFollowersCount: 0,
    postWorkersCount: 0,
    labels: {},
    followersCount: 0,
    premium: false,
    userRole: Constants.UserRole.user,
    deleted: false,
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    updatedAt: admin.firestore.FieldValue.serverTimestamp(),
    deletedAt: null,
  };
  console.log(user);

  return admin.firestore().collection("users").doc(firebaseUser.uid).set(user);
});
*/