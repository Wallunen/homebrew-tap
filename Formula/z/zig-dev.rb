class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260624-024530"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "16f5b8e41bad8638493d940d2b0f7ac4d596a742489671bcc28f51713405b65a"
    sha256 cellar: :any_skip_relocation, sequoia:      "14e9bd2821b7846c195c5813f0db642970ca9114b69f3dd0ee92411edfd2d8d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1d312ce26ed8ad90467de1d3aca23193c2affa7a85cb3ed8be9c4bdc2b7cbfa1"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b1f7b93e02eb878f48e73b6f4567fa544e83bdf91e23d043ae69fea8367d9818" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7b85e126eda9c64085cbd63436055cc4e0535b743d8c753918fcc94b7e993bb8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "11d995f47f847c3394bb8555d7d8841e686ac6ac8c521c8ce62a6616e6eb0b48" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.956+2dca73595.tar.xz"
  version "0.17.0-dev.956+2dca73595"
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
