class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fac2c4684fb75432de81772f0ea76d1a57c7964a5e34e7cbb03fb65878c6a947" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "37e7d4c5ad658bd14be2922f766a7b77daad4ca1c4426107b53a92db40eb471f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "51bdf4502c046fc01815d4622368741cce9d773d0c5bf80930f10f3d74a682df" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2201+89d4ac628.tar.xz"
  version "0.12.0-dev.2201+89d4ac628"
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
