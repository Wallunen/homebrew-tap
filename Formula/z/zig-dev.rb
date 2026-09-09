class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260908-024048"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "969d46b980333f414f047f539db48ae54325befd051bcb0d5d6f8c5e03f666f6"
    sha256 cellar: :any_skip_relocation, sequoia:      "79904fd01df9ca589d56665a954394e52ae05d82bf54d8f1cca483d5997d004b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d233bf27132f95bb62ba7c4888bb1171e96e28108270c030050f58f5619146b"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "7d5cf0363c2e921f41e8cb5e28f5406f70ece8d16b91ed53ab759769f4ad488b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b3cfd2744a79c35860e6c0994804b5f21e882a644ccd92a4988c0b7cbe04641f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e07d5330e46420c56bf6c725fa4aed655292dcce3286d6d77c64e6bdaf90e307" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2085+5e36170b5.tar.xz"
  version "0.17.0-dev.2085+5e36170b5"
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
