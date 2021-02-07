subStringBydii(String str) {
  if (str.length > 40) {
    return str.substring(0, 40) + ' ...';
  } else {
    return str;
  }
}
