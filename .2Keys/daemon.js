/**
Copyright 2018 Kishan Sambhi

This file is part of 2Keys.

2Keys is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

2Keys is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with 2Keys.  If not, see <https://www.gnu.org/licenses/>.
*/

/**
 * File auto-generated by 2Keys
 * Used for windows service to start 2Keys server
 * Project name: KeyboardOfMacros
 * Root dir: D:\\Users\\Kishan\\Documents\\Projects\\AutoHotKeyScripts
 * DO NOT MODIFY
 */
const { spawn } = require("child_process");
const { createWriteStream, writeFileSync } = require("fs");
const { join } = require("path");

const root = "D:\\Users\\Kishan\\Documents\\Projects\\AutoHotKeyScripts";

// CHDIR to root
process.chdir(root);

// Create log file
console.log("Creating log file...");
const date = new Date();
const logger = createWriteStream(join(root, ".2Keys", `${ date.getFullYear() }.${ date.getMonth() }.${ date.getDate() } ${ date.getHours() }.${ date.getMinutes() }.${ date.getSeconds() }.log`))

// PID file
console.log("Creating a PID file for this process...");
writeFileSync(join(root, ".2Keys", "daemon.pid"), process.pid);

console.log("Starting 2Keys server for four...");
const server = spawn("2Keys", [
  "serve",
  "--pid-file",
  join(root, ".2Keys", "server.pid")
], {
  shell: true,
  env: {
    "DEBUG": "*",
  },
});

server.stdout.on("data", (data) => {
  logger.write(data);
});

server.stderr.on("data", (data) => {
  logger.write(data);
});

server.on("close", (code) => {
  console.log(`child process exited with code ${ code }`);
  process.exit(code);
});

server.on("error", (err) => {
  console.error("Failed to start subprocess.");
  process.exit(1);
});