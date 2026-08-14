class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260813-012503"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2dad340e35f8924a1caaed6126e1de8b3669847856a129d6177ec9a90f321340"
    sha256 cellar: :any_skip_relocation, sequoia:      "e38604f5e4ffa539b925ea517b4d83cca56c58f28307c44a79295caa3759db23"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e19d70269143ac84aa25a98bd1d62b49b3c55caaebba5f20569fa71eece9e211"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4ca038d75307fb3553084f7ff8dd56c3524d0607df71eff7e2afe91ff589493f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4516688bd0a1d78f0fa17e5a8444f5ce86a4323fdd69bd0fa7c06e1855ac6dc6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f707a6c9d3211ae017cb076cd99212a87d44f902d617516555625f1b789e9be9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1745+ac8a8d0c5.tar.xz"
  version "0.17.0-dev.1745+ac8a8d0c5"
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
