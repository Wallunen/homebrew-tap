class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8401c15606d515696d05a507d838eba9e145657f65f1557f8c10e2ac99800d54" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9db95643056264c59ef983436cf6e15e8093214ab2e44cd33fb16a56bf551f55" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b7bed9eeaa2c5a13e5d258b31038524a3f320b40533b443c8494e48f5e7317d3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1762+cfd3bcffe.tar.xz"
  version "0.14.0-dev.1762+cfd3bcffe"
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
