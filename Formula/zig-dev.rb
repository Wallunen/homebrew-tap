class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bd97635a2a7d92339e992799962448c95dc38a693753202666c056203c139942" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fe055163dcf7797b439c36a824510d1ec28d63a34838db3b3c37af7d961f7770" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "99bf135a20f30f7235ed424b09c6e7acae5c79f0735ef0cf36952f5b33ebb198" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2837+b55b8e774.tar.xz"
  version "0.11.0-dev.2837+b55b8e774"
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
