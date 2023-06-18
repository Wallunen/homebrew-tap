class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "54fdead88c2d8b13bd0bd2a7018da9ca2f05298d4f819454e89d56b9f037c098" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "241904920fce1d2ca8ef304851f669e2816464666637b45fae4c697fb890c148" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5dff753a3b809c7610666db4c576727099eac358befcc473f70dfcaee12a4ca7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3681+d41111d7e.tar.xz"
  version "0.11.0-dev.3681+d41111d7e"
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
