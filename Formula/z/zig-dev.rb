class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260810-164810"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "efd1a398c4515be17b34a68ade81ab49ab0ffdd8035af2733c1051870efe0a9e"
    sha256 cellar: :any_skip_relocation, sequoia:      "d615430801dea88209fa8f95640a21d245061fda2646599f90b8fb204a8ea4d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb06cbe3abe09e8aac3754b51310b69098256435e48a1ef249c47eae65146d54"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "73c8fa766abb845856fc26f96d9dca5c6d4594542afe6a340001d98517013042" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "862654ed3da823fbccdd6669fec3adc361b7c4624954e6fdf487384c24089bb9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5a7acbcf682795a14fad13eac03ec67d634b785a181a1ca21835f7600291b2de" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1662+cc6f42302.tar.xz"
  version "0.17.0-dev.1662+cc6f42302"
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
