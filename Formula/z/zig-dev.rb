class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "691304a568415222284d3e7f30b0db1d9b696d8a2e9a767abb4d795a6346f00d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "62e6a11e87f37fb0d55eb035e98005ac4a9ac9e7892dfdcba7e05ed63b0e6b6c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "951c7ad6f0140ea49bfbae2e9f33e25910d6bd0ca862621832d535e1e896089b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2613+0bf44c309.tar.xz"
  version "0.14.0-dev.2613+0bf44c309"
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
