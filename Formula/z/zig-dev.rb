class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "12ffc44de9f1c6332564ad6220e1549210d4fe954043acc2c7b18e2cad77da0d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5899f63ebbf6d9efc9ca08bb80e235a54e2d97835dbc35c4a668e2f23e354268" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fe7be66974e8a4f78c81a4e00d3bda4cd7a48033e0b682129776cb5631843cd8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.571+f4f5b2bc4.tar.xz"
  version "0.14.0-dev.571+f4f5b2bc4"
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
