class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260410-090245"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9bfc796405cdc0c94d15a85a06d9e3b3351094bb7045d511c051e9397090d06c"
    sha256 cellar: :any_skip_relocation, sequoia:      "1f5c2cf56067fe6e79a7fd34bc5dfdd57bec18f5466c7181bb31d1a05d80d9ad"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7f0f8029509a04ab824e4f70b78e741cea95772137659e5357a1c8978496e694"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7ff94c3c5b70e6b90a9aa74308e05f36620a1c0f2b5c7b62635310eb1c93310b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0ab967ed551814e7450ce9b6dc11853c96697e9307b8f9bb4283669d3a9860a8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ab4e7bf6358a63e50aeec2243547b63791c75523685ad458d0c339448d723a88" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3142+5ccfeb926.tar.xz"
  version "0.16.0-dev.3142+5ccfeb926"
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
