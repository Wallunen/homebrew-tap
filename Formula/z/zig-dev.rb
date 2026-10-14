class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261014-195539"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1950faf868abd6032ca329052de0b9ea0c322d2a858d7ba21496f45e9d60fd6a"
    sha256 cellar: :any_skip_relocation, sequoia:      "315f4aa72b0134ea65798aa1bd9a663d74a9e4ff7a06451ad508459d7b83db0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c9519203eee53029a799a78326b606b6fc0a2c73447a4fef51abd9b4b03b5095"
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
