function splitName(fullName) {
  if (!fullName) {
    return { firstName: null, lastName: null };
  }

  const parts = fullName.trim().split(' ');

  if (parts.length === 1) {
    // Only one word, treat it as first name
    return { firstName: parts[0], lastName: null };
  }

  // More than one word
  return {
    firstName: parts[0],
    lastName: parts.slice(1).join(' '), // handles middle names too
  };
}

module.exports = splitName;