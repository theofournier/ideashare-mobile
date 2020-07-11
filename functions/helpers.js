exports.getNameFromDisplayName = (displayName) => {
  let firstName = "";
  let lastName = "";
  if (displayName != null) {
    const name = displayName.split(" ");
    if (name.length == 2) {
      firstName = name[0];
      lastName = name[1];
    }
  }
  return { firstName, lastName };
};
