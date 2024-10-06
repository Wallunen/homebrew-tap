class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d6cbcc80107d9f1eda9bb0ef6607de932e88d115e177ef1c330f0d08570cf358" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2d49fff0e7fffa844b4c96efdbbc68fe6e7a56cf60590c0e0887b9990cd23c92" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "94784ebd911b6540f49b5c2d34a09ec2e6732561d9f45f915fc38e5b6049acf3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1765+73de620ad.tar.xz"
  version "0.14.0-dev.1765+73de620ad"
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
