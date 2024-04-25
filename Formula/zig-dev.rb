class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8ac0a7e80c457c6cb1e0c469eb5b86bf20dd2b4b8c481acb5a4e99d8d3ae74ba" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "79207a018d7f2e658f8e81fd97f3498a3216ccc7b9c895dc875133e0e2e86e81" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "321f4d04fe43c6cffd9b5e1fa0b6123e77681c8c9ec5f6da789a9b24b8654df3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.13.0-dev.44+9d64332a5.tar.xz"
  version "0.13.0-dev.44+9d64332a5"
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
