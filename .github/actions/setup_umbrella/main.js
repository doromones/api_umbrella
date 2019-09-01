const exec = require('@actions/exec');

await exec.exec('mix local.rebar --force');
await exec.exec('mix local.hex --force');
await exec.exec('mix deps.get');
