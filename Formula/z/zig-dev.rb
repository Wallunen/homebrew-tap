class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261008-205835"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9b3bc7af5b942359d2c5559739ff91650ee82936dd938a887c5403b90114cc71"
    sha256 cellar: :any_skip_relocation, sequoia:      "f568ef49e69a62dc6cb5202910d1feb573bf06acda3a9cd0dd6309306fdec34d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "73093e47c15e5a3991f21c4ce9873c94b850719f98ff13e2343f79158ab2b676"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "792bae330fa10186f7950e82af75bb9be4940fb85997c0be221737eeb085aa2b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "48935a7ae2519a553b4f9eb15400d9bb561010ebe8dc56bdc1d852de3306f2c6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cdecd965d8b8795afbb9f1a780904cba190d257ee7cd1d33347c4026dab5f64c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.131+41f885830.tar.xz"
  version "0.18.0-dev.131+41f885830"
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
