class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f54091d10b8bf2384c123b5477b4bcdbb5fc64db69c10694407fff5e33a957f0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "890e4fc2c64fd6b9846659ca4f98d93487d1838402c1b8bd1e198a03aef9d4b1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "510497f313ff9f54626852a8b284c57474f21a9461425bdd81880e293c52b92d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2637+7fad555e5.tar.xz"
  version "0.11.0-dev.2637+7fad555e5"
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
