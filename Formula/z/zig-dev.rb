class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20261004-133710"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d4a330c079a96fcc01b1cb9d66963f9b1ca4e363711aaa0e333a098a33214171"
    sha256 cellar: :any_skip_relocation, sequoia:      "1db33bf23cf59719a809a651e53ff677cba4ed611a33f9d72eadd14f7429665f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f432d72d6ad3fc3215e7098d32d7128c91a34757a9cf4dc0ddbfc69f54dbfac"
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
