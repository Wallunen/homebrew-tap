class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260424-092611"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "fd4049aaf651ff7315c265a05520edcc7f65e7ae5fef30122c48a4a031db8417"
    sha256 cellar: :any_skip_relocation, sequoia:      "2a81a7e53cf315a082459676a4ac7c8ae0dd14d6d24d4f6300c8e53fd7385893"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0711acf2807dbdae53e7609f3e723216f58ae2210ffa54fa07abc2db8dbf2437"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "197290958cb4ac81ea2fa54ab53f82bdbe4cede1b2f73b8db6e3557ae933bb1c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "733d396683b183d73343c5375add47c591a47c81a3eff8beb920cff3e0c0f007" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "38f9af1ff86e093038dd1cc581e50b512dbe6bcd06548bbf3df2e728ba93f920" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.101+4e2147d14.tar.xz"
  version "0.17.0-dev.101+4e2147d14"
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
