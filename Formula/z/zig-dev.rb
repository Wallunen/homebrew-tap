class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260705-023544"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8086b79694f20212eda8663a66faf20a9b5b29367b86483c554a916860042cc1"
    sha256 cellar: :any_skip_relocation, sequoia:      "4ac2cfb686af569dba4c24eb1ecc91c637658399edaf020f3a94480fbb366358"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ec1c87e55ee2c21fd0d8b660deeaf055943750bca8aa71c229c78de52fc975c8"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ca096cee4f2bd5be056b7b21cefb140aa75b7abf2841c6b13fc9dd21c298c6cf" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d8ea61e5f16b13f2fadf1420f2bfa4ff5dca5a503853c6b1e674b44cb8837f30" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "aecabe2449260487906c6411e707e3c5426dc9b8f9c328640b7a5bc67c262492" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1245+efd6f190f.tar.xz"
  version "0.17.0-dev.1245+efd6f190f"
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
