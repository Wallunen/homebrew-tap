class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9b2c75f32b83f807ccb2604c4b2d3e3b57077da5257eebebc63593a4e0b0b8ff" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "de905d188d426a1b0c5799b2200e526a6e03b336b8d90970a893d3b498457a32" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a84284a473817f89112f8736e3aa09c8e83dc1c4fd721980efb8ff04c114a394" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2777+2176a73d6.tar.xz"
  version "0.12.0-dev.2777+2176a73d6"
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
