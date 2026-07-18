class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260718-015752"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9d7412bc4fc52a41525d2f53601308429963c053e715a128433d4b2b349808a1"
    sha256 cellar: :any_skip_relocation, sequoia:      "53ae571d9be46d4468f26d851b4bba29f858666247bd0c1e7441916f285a9b35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4326bc1a3eae7bf9c017b8a040ed03fc29a6db23dc87fa0f9db630da248aa86"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ad0c790da6aabf0b4b795ecc08ca4e2f4c50be0dcab69d9d139774fa105942db" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a13a48c6f0ce94aeab093f151735af0d58ece1f17b55feb22ded612da7ad3096" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0cfcd56c81ea33b08b8238331c10ea939c72e199ce6fc11f28e70d5f004860f6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1417+20befa4e6.tar.xz"
  version "0.17.0-dev.1417+20befa4e6"
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
