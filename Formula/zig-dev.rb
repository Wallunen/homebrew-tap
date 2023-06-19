class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8a74de48f1cd15e39ef6198de11f000254d5f43c914a8ffc5773471196f894d1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8ca57ddbb7201a9297700822e13de32f83e21a45db7994ed409517993eb3a7b9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3e2c51108bf812d31dd89d08abd8c84b74bf2d22b696e3ea2136825ebfd1878b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3704+729a051e9.tar.xz"
  version "0.11.0-dev.3704+729a051e9"
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
