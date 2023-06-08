class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8b6c52bc2b99394ab140f08264cfcfba7ddf7821e2c33bb62ec59584405f0602" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0550b24aebdfdefff60d99c906e3209759bb72f156b1cfd83b1b20763db88934" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "35e626e42e9a1f38533e74e6c5951a087ac0a1eefcffcede78250fc55d8242ca" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3384+00ff65357.tar.xz"
  version "0.11.0-dev.3384+00ff65357"
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
