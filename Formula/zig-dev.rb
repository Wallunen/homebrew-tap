class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3db51898b73b5a74816d09dab5e00fa1fde2fb8d30822c73725e61f3a0ad92df" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8974002ae589eb0df1617c619f432e274c0275f7168152a0b4a3f6b0203123d3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e8903b6d949650df7eaf87ef8355293a941eac4738a32edba3184dcb0e0384c5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1891+ac1b0e832.tar.xz"
  version "0.11.0-dev.1891+ac1b0e832"
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
