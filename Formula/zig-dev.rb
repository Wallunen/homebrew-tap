class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5746406fd99a298b7529bbac73b0e4d28c3ab42612afa5c1c71392dcbe58575f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "fb316408802f0d82927f4d5ae0734b0c56ef3e537cbd57deca4109325fa9493e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e948fd979ffdedbc40aec387cddbc9b0bd578dfd2c6f77ba478379b9a296495d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3859+88284c124.tar.xz"
  version "0.11.0-dev.3859+88284c124"
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
