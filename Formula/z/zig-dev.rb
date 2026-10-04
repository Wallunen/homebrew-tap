class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261003-185629"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1461d41ccb783baf100fb4b17578086abe961c8ccb18fb1954b0b732fb83980f"
    sha256 cellar: :any_skip_relocation, sequoia:      "2beb47aaa4590c351df629db2945f984570cdab90698c987fe625d84c993615a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d62b0c5b3de73887a49b6e753aaf5d51f9e1f9c2be692aae29c2b3d3a55def76"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f52150eb819b291161be846e959aa536ea2726a51e131d20a78c3ca6c0122f0b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "0fa7fd3c16f1067a974e9f7e0308135acdd1908a1175d2b6068b47b028cc1be6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "46e2618bc970b50deed2f63e1e30f9f00a37600e29c5cc875fd5dc94371f9370" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.18.0-dev.2+faa537cf9.tar.xz"
  version "0.18.0-dev.2+faa537cf9"
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
