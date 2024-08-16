class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "26a83b98c0be41ec2bb1e402136445d24f678a8a8a03a8e6275b9ebfe50b278e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "79fc2a11ab59ec23970ce22dc59c33d30183c289330c30eb9e766dfb3a630628" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ca721acf9a77999478b0cc59ba0a9b61704bb4ba6dd26a19534a3d5bbe329b2f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1078+0f0f543a9.tar.xz"
  version "0.14.0-dev.1078+0f0f543a9"
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
