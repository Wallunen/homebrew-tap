class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2e9534b212f1d65f7a816f8d243aed56d660e5632a5930adc4225723eeddd7c6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "297d8897b0bf4141e6bbe40a978d8ef1a859f07e087d92ea0fcdd0382a193527" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c10161d1fe01de29f7d7c92a0fb76f7b450c7b42a620cd443c418c187b559ab8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.121+ab4c461b7.tar.xz"
  version "0.14.0-dev.121+ab4c461b7"
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
