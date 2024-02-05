class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "792f007ed200a64d7ae3122d7cc0a52999aa123d5a11e491b713144c0d27032b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "79d8b9f6718cdeb0810b178229cfe5a685da43d8c80a969290e3184c2abaa73b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cc745580d7bd87414c935c5b5c22c3aa56f9c1d9098600b8a9dc2f106bce930a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2587+a1b607acb.tar.xz"
  version "0.12.0-dev.2587+a1b607acb"
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
