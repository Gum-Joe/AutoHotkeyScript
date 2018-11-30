const fs = require("fs");

const file = fs.createWriteStream("unicodeUTF-8.txt", {
  encoding: "utf8"
});

const MAX = 130000;

for (let i = 0; i <= MAX; i++) {
  file.write(String.fromCodePoint(i) + "\n");
  console.log(String.fromCodePoint(i));
}

file.close();