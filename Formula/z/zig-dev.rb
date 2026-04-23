class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260422-091435"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1ea3071e6dc3944018ef84e16605d64259b41564c9a60c4c201fc6bab3947a90"
    sha256 cellar: :any_skip_relocation, sequoia:      "32bcd6e8cf4b4b3b2dfabffc704d5a0f3d913bfbf44b7a84ae71fd98bc641892"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb7b05fa74e9604ec092815774cef20374ae8e31b87270e612fecab4159e5930"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "936a88ba86809f3adcb3a97689ff2de64e98118c57db51bab5ecf1fdc6c44c0d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7ad7b7b9120c6344ee5a7cce54f0f26c52991d47eb65323be935616b442fdfd8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c0e69671184873471a0a91359971100ed0aa0b391aa94905f8b8c90b2cc16696" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.76+ff612334f.tar.xz"
  version "0.17.0-dev.76+ff612334f"
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
