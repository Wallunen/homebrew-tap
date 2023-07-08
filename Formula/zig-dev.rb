class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "da3d90da429c249fa5a04991770100fcc83b76ea4c6d7616cfeddf5a22f588a3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ea9bd6fd146b275fa2a6873f285df07833105b7b25c70ae64dc53c4113e7e5bf" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "dda03e7b6e509848cb89d83db79ed1d8c27d27c19b0f4ad90c760afb2c8be995" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3947+89396ff02.tar.xz"
  version "0.11.0-dev.3947+89396ff02"
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
