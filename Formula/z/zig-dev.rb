class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260505-095716"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "346d3fb121195577992387ff41106da6464be5686db7a794c62caa0fc94ced31"
    sha256 cellar: :any_skip_relocation, sequoia:      "d8ff4ac19c2827f0e7bfa82187c68fb5b071a60917c40a35c17a90fb965631ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "598c486d938015e2f4f32f2a3e854400c7e4fd21bbe3d3747e2b9d2760a633d8"
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
