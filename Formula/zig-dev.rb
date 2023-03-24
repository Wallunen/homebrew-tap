class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "96a7c38c114d61c81e1f81a0fc162d0eda12a8dbff3c7a4f76e9b48a4abaa0cf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a77b8d6be164a886f95d0842f4c74b20bb8c3044292630c3d978c6697da997da" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2eef41bd10ccfa4c31c00fd3c9373275c430eeefaf78ba275da129a4e8e2a25e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2247+38ee46dda.tar.xz"
  version "0.11.0-dev.2247+38ee46dda"
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
