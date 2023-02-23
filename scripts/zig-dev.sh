#!/bin/sh
set -eu

self=$$
file=Formula/zig-dev.rb

try() {
  "$@" || kill $self
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
    --arg formula "$(cat $file)" \
    '.master as $info |
    $formula | match("version \"([^\"]*)\"").captures[0].string as $version |
    if $version == $info.version then
      halt
    else
      [
        $version,
        $info.version,
        (
          $formula | split($version) | join($info.version) |
          reduce match("sha256 \"([^\"]*)\" # (.*)"; "g").captures as $capture (.;
            .[:$capture[0].offset] +
            $info[$capture[1].string].shasum +
            .[$capture[0].offset + $capture[0].length:]
          )
        )
      ][]
    end' |
  {
    read -r old_version || exit 0
    read -r new_version

    cat >$file
    git add $file

    name=${file##*/}
    name=${name%.*}

    git commit --message="Update $name from $old_version to $new_version" $file

    if [ "${CI-}" ]; then
      git push
    fi
  }
