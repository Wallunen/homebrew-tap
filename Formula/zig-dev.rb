class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "12ee2977a1c45cc21027ea2a1421b4115a9487080f502a5f2295bac1d7c470c5" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "57188452d34eccaf1140a98b0662763aa9b2b1efc6b7277b52e5a1d646746e04" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "18ef158bae02bb5f2e43545e3d12863a3c2c3eaa77691e69b4904e0896215242" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1824+a7a709aaa.tar.xz"
  version "0.11.0-dev.1824+a7a709aaa"
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
