class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260622-033941"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8e8e619291bc0b3f179af79f239109681df77da8c57e69e74dbdd743c8b985b5"
    sha256 cellar: :any_skip_relocation, sequoia:      "e01b698d663bffac1beb4126259fdcb068f7ffb110a91ba295778d9d9604fda1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0de861bf0f0e090eb4805fbe265ead4781ef2283d44be14d65444c4b6b89d19f"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "b1f7b93e02eb878f48e73b6f4567fa544e83bdf91e23d043ae69fea8367d9818" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7b85e126eda9c64085cbd63436055cc4e0535b743d8c753918fcc94b7e993bb8" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "11d995f47f847c3394bb8555d7d8841e686ac6ac8c521c8ce62a6616e6eb0b48" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.956+2dca73595.tar.xz"
  version "0.17.0-dev.956+2dca73595"
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
