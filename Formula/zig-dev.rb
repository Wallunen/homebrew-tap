class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "466c2276d15423b6cc4909ba6b6e5d2e3d7f9103ab9243feed48d0e29fc1c543" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ae828f571f636aa083d8fc7250ecfc363ed6bdccce1cac43a4df6356d934e9b4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "77a4914eb08a7c08674f56ca1513070b319bd9dd7f10cf94d094dbfdb0a28795" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1836+dd189a354.tar.xz"
  version "0.12.0-dev.1836+dd189a354"
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
