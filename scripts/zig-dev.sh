#!/bin/sh
set -eu

self=$$
file=Formula/z/zig-dev.rb

try() {
  "$@" || kill "${self}"
}

# shellcheck disable=SC2016
try curl \
  --fail \
  --location \
  --show-error \
  --silent \
  https://ziglang.org/download/index.json |
  try jq \
    --raw-output \
    --join-output \
    --rawfile f "${file}" \
    '.master as $m | $m.version as $v | $f | split(capture("version \"(?<v>[^\"]*)\"").v) | join($v) | $v, "\n", gsub("\"[^\"]*(?<a>\" # )(?<b>.+)"; "\"\($m[.b].shasum)\(.a)\(.b)")' |
  {
    read -r version

    cat >"${file}"
    git diff --quiet -- "${file}" && exit

    name=${file##*/}
    name=${name%.*}

    git commit --message="${name} ${version}" -- "${file}"

    if [ -n "${CI-}" ]; then
      git push
    fi
  }
