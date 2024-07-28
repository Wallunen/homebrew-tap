class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1525be89e09898a7016f7da4cd57adb0a1c60ac927f0a578f1a84dbc0bd5cc10" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "032a3ce5df2bc419c6ec1f29983d23da7f4ce8e7ab81b7312ad0c3762f32bd00" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c87cf4d901867962c6bcd5ffb68ef67171f8613e59b8e25adda252f12d956c51" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.622+a84951465.tar.xz"
  version "0.14.0-dev.622+a84951465"
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
