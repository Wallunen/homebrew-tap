class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "eb4e409cc84991dc0ea8e3e550edb2254d0b15be5f59f2cff4bdc406a9b1ec46" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3a62f5a535c532978c6a7d248a1f141004de0812fa4b432d50f5dcc9e29e2a55" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "019dbe76a9035ae4c775483ccb860a740759e22c8bbebd0234f8eaa2a7458cd7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2619+bd3e248c7.tar.xz"
  version "0.11.0-dev.2619+bd3e248c7"
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
