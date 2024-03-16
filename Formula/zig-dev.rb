class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d14e329ca9c29b8c06e9efb99f9c01ac67580e228eb1ba5fe5cae94a2a114be5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "46c34d94be1ae638623913c5e2a4df3b2e0c9098f32ea8c8a0e7ad8aa27a4d31" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9dde4fa354893174ce245883e9732870d1d139c1bd7e551f4d157fc494122a57" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3322+a4508ad71.tar.xz"
  version "0.12.0-dev.3322+a4508ad71"
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
