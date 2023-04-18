class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e4a759786bc8aa04868635f2f3e7e3c7f9e808ae3387337b9e6d85b25c3f5852" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "dee759a0a70d432da937d7388d7825a54bb3fcfbecfbf751d542252fd6cacd18" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ab95cc4e53c27164b0ff3347ff2df257d8bc2348fd0803af2ce04cf2bfd4d7e3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2646+3d33a0906.tar.xz"
  version "0.11.0-dev.2646+3d33a0906"
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
