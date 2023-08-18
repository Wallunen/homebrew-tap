class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0a9d431956cf27308d2cce8884a99703ba8c9e36f32ddcb116324aa9f5e999c2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "97777f9f7322b447cb68723507831226fabc436b453c633cdcf63ed5c18d39ba" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9328476fde370c5797bed5b2cabedc96fc5ad245204ec884f32fc6d153c3d989" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.125+7ef1eb1c2.tar.xz"
  version "0.12.0-dev.125+7ef1eb1c2"
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
