class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "65db3dae04362875b3f0930ac86ed4fcf03e194cbd32676279fa68d12f2a52ac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "08669328121e6142e6657a059b08d76c59463d576ac0ad027f117381be4f0642" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0ccd0a460792fc3a4dc17fb1c375e07f687ceb20fecf0b6d753a0e824b37a069" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2032+c563ba6b1.tar.xz"
  version "0.14.0-dev.2032+c563ba6b1"
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
