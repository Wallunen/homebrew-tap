class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260827-065018"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "7af28610208d6239fce165418390c465eb0903b290b8394d280435d456367234"
    sha256 cellar: :any_skip_relocation, sequoia:      "0d5d7fe9589d0ec122e1de307fbaf1159595b74801d8edf817709943b0ebf37f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "347a9ade86fa8e4f7ac2f212cc5f85ab17fdd00becf5996629041c82254f7c7a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "21899cf33da4a026561b34debf13f9b0055fee3513444e0afe9e2aa1d42d4167" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "123c3005ae30537ab1731ac3e8cf34fc34a78afc312fbc782ad8937b1486a63a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "56fad4a122709d3a5d0bb1d34ea2726633870ea314e726a0a7174dc29ed95e40" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1893+78e3b1c73.tar.xz"
  version "0.17.0-dev.1893+78e3b1c73"
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
