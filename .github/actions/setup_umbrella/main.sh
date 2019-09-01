#!/bin/sh -l

mix local.rebar --force
mix local.hex --force
mix deps.get
