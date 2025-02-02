class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "04112d702dc4e6adfb1ccee575e320954e8f993bd633864212e44531bfba6015" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "60081cde5edbd557b949d0a56b81f79f2ded96af7b2dfffb526929be88099945" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d30bde407e91d791c545c74f39b601c6cfb49e4dbb12c0e0eac91ce74175e5b8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3020+c104e8644.tar.xz"
  version "0.14.0-dev.3020+c104e8644"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
