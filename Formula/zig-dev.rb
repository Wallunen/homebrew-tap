class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8cabddccb80ec1145eb2b79d16fbb6907ef190b50971eb87144245c9d61c3b9a" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4021453dd6e85449cf23bce29089d0b8e705481820a4b08b49323bb3f21bce33" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "12db4c1110ea71577a64e5cea928dd722c8a6491d6ed01b5423bf7bb13cf0f6c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1808+69195d0cd.tar.xz"
  version "0.12.0-dev.1808+69195d0cd"
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
