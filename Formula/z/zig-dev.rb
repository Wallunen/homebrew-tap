class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "800338f0e2fd84d01d1e7990546a9a3fdd1b013613d5b2b696392268589bb514" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6c845692b95785fd926acd1ba5e290e761d089f3edb9aafdd33d6e21888b3df7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d6edd08c5be44028d4809d3be95f9bde421ced14a0565138600d25d8a52ec0f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2092+ba5f57616.tar.xz"
  version "0.14.0-dev.2092+ba5f57616"
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
