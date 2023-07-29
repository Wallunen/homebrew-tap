class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a8f554ac98cd74449e2c6aab868bed2c1e92c60a9cddc754407effba84bce65e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "49f0f705a6e81154abed4c90d2cda5b37c840404ff8dbd49b7c261a9cfbbc55f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "df24d21691eb87042051746456705315c41f4d3627ff5246c477762f17c32737" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4299+20f4216af.tar.xz"
  version "0.11.0-dev.4299+20f4216af"
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
