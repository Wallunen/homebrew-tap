class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f96764d6e53023c4f2d7c604da468cf81d012fe47b13af1297f5b9a06af0a7e9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "39a6a8aa5aa0997e8f36076f4449f2ea0ace956a7d43df8e3291a3c8cc323560" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6f2785bf1844e23ddd0de883c37ed4f9e520f961b673e2d7245c8e6cea100d5e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2154+2089b3f19.tar.xz"
  version "0.11.0-dev.2154+2089b3f19"
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
