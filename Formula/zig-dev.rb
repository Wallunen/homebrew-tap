class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7512b8bfb3cf003e01912aefd3efbd6b2d9db34682c453a8616b8a46e86a2e59" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "da8813f7b140543c1b445c389a5df0dfab5759054c0d60ff6c812515cadac8fb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "195b884d3a4ff9e8d107199e250208108648b3075e51c15556740bbb1cd2c5e0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2828+5b9e528bc.tar.xz"
  version "0.11.0-dev.2828+5b9e528bc"
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
