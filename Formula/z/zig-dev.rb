class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260903-190138"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1db2f712bbf6074f3db7044813cb4091a3dd42dfc51f91400568e727d52a258d"
    sha256 cellar: :any_skip_relocation, sequoia:      "08b88a8da244e7aeaaf27cf1f7cfdfd7e6d6a041fdfbe19c653bf8099ad521e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3f70930f74c87e716546eb2bde66ebc4d9099f8aa4caab3b4453316b5f876d91"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e7679c126f2ec7c2d06c3bc61f952b8619e70dcf0303dde157c88c54bc152501" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "53f6d4a65fc98d145e532ce7cf1cf44ff7928891e451f44455b297b28ffb3c9b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "08d8e7cf715d26ce56164a2ecb9a8cc379c6955c524e8dc3dcb638f526f29b00" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1980+e78ea8f2c.tar.xz"
  version "0.17.0-dev.1980+e78ea8f2c"
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
