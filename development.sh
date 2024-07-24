#!/bin/bash

function dev() {  
  if [ -f "package-lock.json" ]; then npm run dev;            fi;
  if [ -f "yarn.lock" ];         then yarn dev;               fi;
  if [ -f "bun.lockb" ];         then echo "Not implimented"; fi;
}

function test() {
  if [ -f "package-lock.json" ]; then NODE_ENV=test npm run dev; fi;
  if [ -f "yarn.lock" ];         then NODE_ENV=test yarn dev;    fi;
  if [ -f "bun.lockb" ];         then echo "Not implimented";    fi;
}

function deps () {
  if [ -f "package-lock.json" ]; then npm install;            fi;
  if [ -f "yarn.lock" ];         then yarn install;           fi;
  if [ -f "bun.lockb" ];         then echo "Not implimented"; fi;
}

function build () {
  if [ -f "package-lock.json" ]; then rmb && nb; fi;
  if [ -f "yarn.lock" ];         then rmb && yb; fi;
  if [ -f "bun.lockb" ];         then dnc && dnb; fi;
}

function e2e () {
  if [ -f "package-lock.json" ]; then nt; fi;
  if [ -f "yarn.lock" ];         then yarn test:e2e; fi;
  if [ -f "bun.lockb" ];         then echo "Not implimented"; fi;
}

function e2eui () {
  if [ -f "package-lock.json" ]; then npm run test:end2end:ui; fi;
  if [ -f "yarn.lock" ];         then yarn test:e2e --ui; fi;
  if [ -f "bun.lockb" ];         then echo "Not implimented"; fi;
}
