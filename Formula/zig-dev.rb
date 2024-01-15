class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3bcfee5e0d904746777f67ff72fea1eb69b1e0f00d14941a0bdc32fecde9c7ce" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a62097c21092daa9048df96712d19637628ba4f0ff544387fa40da4967a14ed6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a38a1f342d4e12e8e98e4e9eaa7adce039ae57f0138fd10ae914ff846bdea8ee" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2197+bd4641041.tar.xz"
  version "0.12.0-dev.2197+bd4641041"
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
