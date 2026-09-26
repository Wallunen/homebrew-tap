class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260925-194540"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1ee3f07ba058ad2780b2a85e63815eecfea80088df84bbc1fdc43eeadc3017d8"
    sha256 cellar: :any_skip_relocation, sequoia:      "16994a35e523002b9333168d07f119ecc4fe2b89d4f0f6c0ee1fd19285e13f3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f445ef99d242deda34a79973ab50c87de725bdd1aabed4fcf75de3e20aa97575"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ca5d7350a1dd5c4801d99bea9333ef038afaada7e8360df1bee20333298eeefd" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4f56f14a3a829d6dbf83c212c8a683b342559a9ba626a091495636a30524cf96" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a0e55986b6db42f6f81b70bc2c0e3bd88e6d804ffaa4ecc496e661ed05e6908d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2307+392b17125.tar.xz"
  version "0.17.0-dev.2307+392b17125"
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
