class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bfc35a6f0d6d7fd74a2464c8b7ec59c5363f327a862846c96e00225075a82e35" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7fb6352632ac5b5c31b4c7f629314d33f08488bfc05c9f75e915cb4f437f1859" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8f886572ad32b93e3f4f1ca9028b1ae6d314c969ae331ceee5a83ece915f8c67" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.161+6a5463951.tar.xz"
  version "0.12.0-dev.161+6a5463951"
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
