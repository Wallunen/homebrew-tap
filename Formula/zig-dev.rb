class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f6518575d99695d93783df6733c656a14314e3fc47f822d8e38efcbc7b4469bb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "09186d5dff05410149662cee79b105f1f473c6ae555b66c0016547393b52a745" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a5e6315c0b20eef6f9a3a59c309a1e1742e839986dcc11483255d7c84a8cf778" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3277+a0652fb93.tar.xz"
  version "0.11.0-dev.3277+a0652fb93"
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
