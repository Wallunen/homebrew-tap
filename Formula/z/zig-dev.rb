class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260524-094953"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "90322762b29eb243b65ae9faee2a1e54dc8b378b937a5ecb43dada087a1855b9"
    sha256 cellar: :any_skip_relocation, sequoia:      "4da7e86dbdcc06d9771c46bebdb79866d7da6f39c51e740ed37843ade643c8c1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0284df436a8abf92ed74f2760d2c8910b93d0fb3551f2ec3d44a34b04aa18fe2"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5f53109193ed5df8dc662478c63e0c446852e557728607156ba59b11c601ee96" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "076719076e70290d568f04ea71cc32e7c2e0ab7aa158ee2aae040f3b041c0394" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "67091228bc85454f4b5f53c42c86e70efe40d3a3dab9b354cc87ad15c756093a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.338+0d4f3cc67.tar.xz"
  version "0.17.0-dev.338+0d4f3cc67"
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
