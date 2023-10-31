class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "730913eb4ae88407bac195792888618145071f47700c2b66b9ea53891cc00d6e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b01d760d102ca6a06d523c6ad84435d4f4d389b1ad71bab69bc832b610bc73be" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "239c70bed034980af5eded579c0e99d02c950b782ef71b10adfacab18bf6059e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1357+10d03acdb.tar.xz"
  version "0.12.0-dev.1357+10d03acdb"
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
