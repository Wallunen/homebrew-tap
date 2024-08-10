class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9db2c91863e57c09260351d2054148810a2a8396f67fd917c02e5d273ffaf30f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "01ac7d9c017374179e85067678986ddf41ff80b67a5e8ae9643d31e6d8301c83" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4fdab39be8365ae82a7d58df6af3d045e8e4aa0153106624c4ec048edb94c752" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.994+9f46abf59.tar.xz"
  version "0.14.0-dev.994+9f46abf59"
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
