class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260705-170248"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a7bbf8d19ffaae04f52a5b8ebee5682fa99648b7857180e7dac2b0304f873024"
    sha256 cellar: :any_skip_relocation, sequoia:      "369c649d33b57fe64dddb0d973d59b3c332ea7e96c8e676b8ff4be7c9ddad2e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9194328059c26fca8da1a707e62c6f191c0925730a75176b548a45557f86fb07"
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
