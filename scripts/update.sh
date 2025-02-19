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
    '.master as $m | $f | . / capture("version \"(?<v>[^\"]*)\"").v | join($m.version) | $m.version, "\n", gsub("\"[^\"]*\" # (?<b>.+)"; "\"\($m[.b].shasum)\" # \(.b)")' |
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
