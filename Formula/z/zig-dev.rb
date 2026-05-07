class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260507-101832"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9f00862324e11384cea3fe8830ef59a9de950d2958caaf6a962069de73f29306"
    sha256 cellar: :any_skip_relocation, sequoia:      "142b325bb7e8675e87831680c2b3ab559fea7b7d6cdc13e376ac3b570a723282"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4698d8b6958f870f7f7d65a17a8705a085e4d55d2bfb880e618473f72a304fea"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "70d8242fbd3c51b5aaa11d2c224339f71db0ca060173a9df5666beac0618b9b3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e492639bf07265cc11a418f7bd9ad70f79c48ab572eb60167f3901e08f1016df" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aeea93194c98e42909627cee202cec49d1a57e2307487fa5e727273c256cca1c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.261+3d1fb4fac.tar.xz"
  version "0.17.0-dev.261+3d1fb4fac"
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
