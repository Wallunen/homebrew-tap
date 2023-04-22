class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "711dfd92a90e3b00ecf2339ea8116637aabd2874480223dbec5b9d2f5cdee6ef" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "54894a5c1395378112c06a962b5705153c3ba3f5aa87a0dfd112cce559d2faeb" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c6c1d51a2506ac2109ba73c5e21378b80ef84c471761b20b79dfa82e0ea016cc" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2696+867441845.tar.xz"
  version "0.11.0-dev.2696+867441845"
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
