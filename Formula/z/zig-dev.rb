class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ad9747b7c9b989ee71c96fb275bdb5054a2ef645ead05b95df591f93fd95a18c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "29316198dc01cfd110fc33b0f5547793e9bb39456e289802d819fffa4ebb9aab" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d36a922c3bce3368a7413c324281c634e16ccade5eb386e52bb0971a479fa91b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2502+d12c0bf90.tar.xz"
  version "0.14.0-dev.2502+d12c0bf90"
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
