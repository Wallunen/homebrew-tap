class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "65e8b90ed8dedadb9cfed025e57219d515cf06d4ca23bcfaf962cb591b224f5c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a2f3808ff95bd8fa679620ea2000cb8361ac529dd92c3e4a62ab8312b7c65963" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d57982d4983227437621bbeb2b6f8265e1d2620a42e2f09c91ae1b2ea98e5c3d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3126+136d7c213.tar.xz"
  version "0.12.0-dev.3126+136d7c213"
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
