class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260503-022811"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "57e3198d3569aa4d217f4b0800a9e6564d37b61dc1f4799b4a8105570a5f366e"
    sha256 cellar: :any_skip_relocation, sequoia:      "bc2052974a03c02abd0a0eee7144c5b4d6f7d7878c5345a7c92cd1975d28fb7a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d3fe63e95d954063e1d90498f1e37cf4a82ffc08fdc7f82590c5b8eb734a766e"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4cf3295edc043ffe66d7a009e614717b276ca7276200ba0420aa6f3dc64dfcb7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bf381b89ca99beb7c4363c5bb5b85c8d27d872b65d5b30cdf7bde702abbf6732" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "82f91ae6e5937ad9f0d2908e6a3a9fd3209d33ebcd81241a43d1d01613ff2291" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.242+5d55999d2.tar.xz"
  version "0.17.0-dev.242+5d55999d2"
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
