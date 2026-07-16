class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260716-020526"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4183d9fa836e302c15f3801f95dca2440a4f4d5c333e937aa83faccf24fea3e0"
    sha256 cellar: :any_skip_relocation, sequoia:      "265f6d68a5a7894d6ba8a3f42e32281c17e6c9f355cb12a15b24bffd0b541f5d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f549504540cfd1864128787d346b8a27c9ec468b35de1ee8bb8a33599df10ffe"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "95d75d6c37f31af0c7639d8a01b616a4e5cd91cb60e6e3550087bb76e21ecf43" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "77aa0c6c3719ebe0c2c94b5d07941d1b2895e8db3616dd31073e692c9b094c75" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "73059a78b96f21691a42d81ad964c1938a55a92aa65d47b79725d4a0a5e1ec11" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1413+addc3c3b8.tar.xz"
  version "0.17.0-dev.1413+addc3c3b8"
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
