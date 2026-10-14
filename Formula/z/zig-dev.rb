class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261014-031138"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "b85998329552a6203242da1492356e53abd2a6480fa30dd21db038e4ab39ec3b"
    sha256 cellar: :any_skip_relocation, sequoia:      "a679c602d136ae5d4cf4b259ebe05f64fc431009929eeb592dc48b2b5bed06be"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "388dfefd855541edfa98b0e3623af2534793ac118059c6af4d9fe9acf9f0e771"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cf7ee94438fe0ccf527b8c2d13fa2f51a6ab44cb1aeabe52220fdf12e539f089" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "422a59788143e54371949562374711ad8ef0fc093d357e27b75fd00239458251" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "67dc7ad4c493945b0d68bb8691849c233d3ee7afaca0c43038e4f4d5e6cbe40d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.253+16d31ceed.tar.xz"
  version "0.18.0-dev.253+16d31ceed"
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
