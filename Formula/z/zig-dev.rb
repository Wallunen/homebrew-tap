class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260706-180645"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c7c6fedb798342b4b429317e1a78a8d6141f792cb58009e67a387bd8e9bc550f"
    sha256 cellar: :any_skip_relocation, sequoia:      "851f3dd300b0e91c7cde94d1dcea8818c3d6eecc43eeab7b65e87591a82d438d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "944b4217c6336258ce83b7bb2a0a5344420515a984797dc5d8aad89fe5cb6d35"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "dab81d81916c85573a3b498a44a7aebb2c41bf5ce966f8d9681acb78d7b2f444" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "6851f9c22005b7c4e8ff059d2988c30e0c5b60bd8b0611c348a5a7e1325811bc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "408551014c404c6aba8d42d7d244550e402eb6a2678253f813f1bac021a450bb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1257+67b05e521.tar.xz"
  version "0.17.0-dev.1257+67b05e521"
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
