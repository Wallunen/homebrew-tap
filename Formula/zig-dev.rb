class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a0a866fdc36dca720dcf1f5d477907dccaf5afcfc2d955316a619621b00a2bac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9cc8b5ae55cc52e0b18d35b715207580714b53c7badd5a2cc15a296493393994" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cc19c9889fcff2369a7636be3ced42baaee9892fcec1ffe7a158cb5abd9b107d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3282+da5b16f9e.tar.xz"
  version "0.12.0-dev.3282+da5b16f9e"
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
