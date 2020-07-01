exports.getNameFromDisplayName = (displayName) => {
  let firstname = "";
  let lastname = "";
  if (displayName != null) {
    const name = displayName.split(" ");
    if (name.length == 2) {
      firstname = name[0];
      lastname = name[1];
    }
  }
  return { firstname, lastname };
};
