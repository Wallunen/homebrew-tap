class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260512-175452"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "42456a09613381e7bb11803fca5aa65d11591a8f1c8e916001c8ab6056bcbf09"
    sha256 cellar: :any_skip_relocation, sequoia:      "373b41ccbb77d342d2064a93492726269e54b0dde92eec25266398fec2cc6f88"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "831325204bb154539201900d1af00d197497913c728f71bad6b481440b35743a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "359d7771a61e9377ef3b14d01a621ffac4802221cf13c5175bfa50e7d19ce0f6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4e7f281c1862ef8cbecf51c6541907acfc250e2dbcfcbeeb7618d1b8b19ecf0a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3d9a0f2c9a06ebfaba41fcd9b5489fa8762b8ba6fe304b4c274880641d27fbfa" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.296+a85a29ae4.tar.xz"
  version "0.17.0-dev.296+a85a29ae4"
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
