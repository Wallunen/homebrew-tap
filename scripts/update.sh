#!/bin/sh
set -eu

self=$$

try() {
  "$@" || kill "${self}"
}

update_zig=0
update_zls=0

for argument; do
  case ${argument} in
  zig-dev)
    update_zig=1
    ;;
  zls-dev)
    update_zls=1
    ;;
  esac
done

zig_version_regex='version "(?<v>[^"]*)"'

upgrade() {
  # shellcheck disable=SC2016
  try curl \
    --fail \
    --location \
    --show-error \
    --silent \
    -- \
    "$2" |
    try jq \
      --raw-output \
      --join-output \
      --arg s '"[^"]*" # (?<b>.+)' \
      --arg v "${zig_version_regex}" \
      --argjson r "$3" \
      --rawfile f "$1" \
      'getpath($r) as $m | $f | . / capture($v).v | join($m.version) | $m.version, "\n", gsub($s; "\"\($m[.b].shasum)\" # \(.b)")' |
    {
      read -r version

      cat >"$1"

      if git diff --quiet -- "$1"; then
        return
      fi

      name=${1##*/}
      name=${name%.*}

      git commit --message="${name} ${version}" -- "$1"
    }
}

zig_file=Formula/z/zig-dev.rb
zls_file=Formula/z/zls-dev.rb

if [ "${update_zig}" = 1 ]; then
  upgrade \
    "${zig_file}" \
    https://ziglang.org/download/index.json \
    '["master"]'
fi

if [ "${update_zls}" = 1 ]; then
  url=$(
    jq \
      --raw-input \
      --raw-output \
      --arg v "${zig_version_regex}" \
      -- \
      '@uri "https://releases.zigtools.org/v1/zls/select-version?zig_version=\(capture($v).v)&compatibility=only-runtime"' \
      "${zig_file}"
  )

  upgrade \
    "${zls_file}" \
    "${url}" \
    '[]'
fi

if [ -n "${CI-}" ]; then
  git push
fi
