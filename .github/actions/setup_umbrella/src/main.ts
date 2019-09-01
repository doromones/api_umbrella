import * as core from '@actions/core';
import * as exec from '@actions/exec';

async function run() {
    try {
        core.debug('Setup');
        await exec.exec('mix local.rebar --force');
        await exec.exec('mix local.hex --force');
        await exec.exec('mix deps.get');
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();
