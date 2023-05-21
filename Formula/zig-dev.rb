class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cf5c163bcf2a242f2e5391cfedc8b86e9c8fa1c8a5b7609a3e599a30ad6f03bf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8745c2afbc1b2c15ed358b321fe368e1276f9361eca5e10880360f1822302e4e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3577371fdd102e16097dc3ee7f2aff228136512113b8b3cf9320e0a281aa1868" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3223+38b83d9d9.tar.xz"
  version "0.11.0-dev.3223+38b83d9d9"
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
