class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5be559be3ebcc328750f39512cc7c07692b4232fba23c5b3bd5856e7c79e0297" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7451537bca49a679dc2b739d34668c2b227614edb988aba6cdb0b6793e6e0794" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "1028bd1bde932453bf0e464edbe9c8ee4174dbf4abf59577f9357fe7f2a2fe97" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1344+37295696e.tar.xz"
  version "0.12.0-dev.1344+37295696e"
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
