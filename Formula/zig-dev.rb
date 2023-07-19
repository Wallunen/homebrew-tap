class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8b0207537a385d978788a98df7ccb32a6d6f1bcb85b3aeca77288de06c9df819" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "496175482d9144668ad0682b6b7924f6ec3d26afa5bd57fa9f75de9ecc4e5525" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7290bc8ccb9cca3081d3e0160faff2157da0e4b569cfca9f34f547fc70029a55" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4010+70c71935c.tar.xz"
  version "0.11.0-dev.4010+70c71935c"
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
