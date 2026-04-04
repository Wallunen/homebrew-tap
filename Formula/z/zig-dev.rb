class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260404-162904"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a0ebd4277d7ad9181ab3881ee14fa77fbbaaca2e9f5d071794e1a31bb45009bd"
    sha256 cellar: :any_skip_relocation, sequoia:      "0f90787196e40518a78c72495b9155c1642854860580cce2ff3e3b8aabd474c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aa634202e54ccc04c1bed3067dec7689e602e55f37a4ac7d0b8394b22ba55ffd"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6a4f8f0de088e033e1a67994abce510e153220534c78c0a8a5358e414cbf1b23" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "04c37ec386efd4e2bc5fa599563d638143cb9a186b1f96b794f2b752a36d9ca6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6cd87dc769190826e330752f8673c5df47fd7b939af7eb097113423240630d4d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3073+28ae5d415.tar.xz"
  version "0.16.0-dev.3073+28ae5d415"
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
