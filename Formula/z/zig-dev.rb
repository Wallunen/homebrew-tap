class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261010-140915"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1b08a12deba4a7b8ed4dd12ff6604fb19e9616625c52872c29398dd35b3d0bb1"
    sha256 cellar: :any_skip_relocation, sequoia:      "a0a2d0330409d2444ae3abc639182fd5870d8566e7dde40629600671fc6c29fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0bc547a3add10f5c40dcbc112af74c005a73d63fa5c91a6c7eed5cb7ce737311"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fa540d12e1fb8f7a5fe05b81978eb5f4a4d87d0facc89720c04aa8957aff4b68" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "37a97f77560eff1dd6c31c03a9c96cc52d8e8f9e12daa2f13469ad2ef5a3d958" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "74eb8580daec569828715ee9fb41de327aaad248e7424cee1d03337015357edb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.246+05671ced9.tar.xz"
  version "0.18.0-dev.246+05671ced9"
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
