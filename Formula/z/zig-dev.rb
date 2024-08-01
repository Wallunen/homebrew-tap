class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "483c8eaec771e0f6ebf4c2c7367b4b8bc6ec45ae1a4baaeb46219517197563f1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "20fdb82b964c689985c07274b4b6d9ea9c93a4b53943fd10595d018eafa7bdb7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3eff913d90bf0e77bd990e2f5b7213ad75556b48251d2c16ab9d6f2e07115290" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.764+eb1a199df.tar.xz"
  version "0.14.0-dev.764+eb1a199df"
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
