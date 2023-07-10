class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "95114502015f7fbe2f57c22e38a426d59b46ac6599c32557c689709963c413b3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "42a7e29720337461e01d002871d94ff43b3b66775f69a8457f4806299bcbc2c9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8d07743427a8ab130b628fa7489fff7afc370d1bd8efb34d481433dd51277f84" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3949+27a66191c.tar.xz"
  version "0.11.0-dev.3949+27a66191c"
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
