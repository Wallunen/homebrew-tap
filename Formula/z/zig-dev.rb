class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "144f3ae7c3868b8c7f4de3989d7838b3d66fc3d0504ceac53655bb12095ed469" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "61af4859c8f631726bf441311f4300cec1b7051578a706d9f516bc4d32a3726b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "469d077df3f7093f57705085c7ea9d1e4d4ba5d656b99f357ccbcd8c53b4c253" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3220+cb5547e3d.tar.xz"
  version "0.14.0-dev.3220+cb5547e3d"
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
