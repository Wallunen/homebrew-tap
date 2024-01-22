class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9e3e7ca13ef64f720960de2b368e1cbe2e3dc904f96f22383f2b8f32ab961b00" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fca0515b5188caea78ef274cac269ada7853c415f69d537ba33248477f336597" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2c1bc140fd63b947793541fb0f170a27e5be5fb16d4566e6b4559585bd55b4b9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2316+ac2930332.tar.xz"
  version "0.12.0-dev.2316+ac2930332"
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
