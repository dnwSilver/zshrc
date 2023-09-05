const fs = require("fs");

fs.readFile("CHANGELOG.md", "utf8", (err, data) => {
  if (err) {
    console.error(err);
    return;
  }
  fs.writeFileSync("CHANGELOG.md", data.replaceAll(/###.*\n\n_.*_\n\n/gm, ""));
});
