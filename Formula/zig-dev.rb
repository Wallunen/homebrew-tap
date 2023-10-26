class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f0d75d01b3a47c7da2d43f957426d96339808cd50358e0cf77e1dc888f70b018" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3139c25e3d63ac022902ca27966959ff5963d8f6839024711c1c40f72487fe1f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c00dd0489e2737ef263a2341e2ed25328fa2b4611032e3373a6b9281912bc914" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1270+6c9d34bce.tar.xz"
  version "0.12.0-dev.1270+6c9d34bce"
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
