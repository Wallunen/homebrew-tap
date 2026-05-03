class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260503-164150"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5cb5c3a22d09e668d84fef70fab5318a3c7b42dd6ed6e6e3eeb12a0400904d1a"
    sha256 cellar: :any_skip_relocation, sequoia:      "2a326aebbd56cac5d69288475c134680751f2bc44b4830d0f2925c865e3096cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5db27c00c23ecb18340e051c37318137fd6348b590b23d806ba1edf76b79c784"
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
