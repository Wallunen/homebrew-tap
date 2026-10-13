class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261013-153000"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "816697a89487dc829df89bdb228cd61bf12bbbce575be85c37d6df3629c72532"
    sha256 cellar: :any_skip_relocation, sequoia:      "da63d555eaf827830604aeb8dff1da4c2b2536ece30114db8f073a2bf804b097"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "87ee191bd63887fbdc92cb66dd6a216dc2d608e1d12d9f5510adfe84157ef04e"
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
