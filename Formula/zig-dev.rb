class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4fcd5551151a9981be51103e6add7caf386c03e3fcf0757b0b453e3a06919754" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5590c959d64918dc49bb9571b96f329ad4fb992dbe6dacf7239082457cdf4820" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "505139abe265ce095ae125fee2fe5595d650fcb77f4830afb16acefb99be3966" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.25+36c57c3ba.tar.xz"
  version "0.12.0-dev.25+36c57c3ba"
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
