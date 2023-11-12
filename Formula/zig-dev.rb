class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9358eb71745681aee6d4b0dee6294f6eaa804786d910f528eaa42731b3455cbf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9fed049730d41c337a315e3b78c7d77a13e6ff467301da76a63d2593fed32bd6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "19aed67151c5bd9d8e4c526569bad7e42393274cff4b4ec6a7e674f2111334be" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1591+3fc6a2f11.tar.xz"
  version "0.12.0-dev.1591+3fc6a2f11"
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
