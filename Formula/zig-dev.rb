class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e96c815c5cc94bb4317890451d7483ed93f5657c6283d7de1212b61d7e520699" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5d86eb49292743e6ab8b48d29621bcec2f268d3bc5f5590bf2fa23cd1b9f8b35" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5893e3c53c6a81b94001ebd2c784036bd73b8dce34c35e7abc5c72085797971d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2322+83051b0cb.tar.xz"
  version "0.11.0-dev.2322+83051b0cb"
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
