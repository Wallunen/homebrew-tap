class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6c6b949f5d1d9661f0de1662eaa639874633580a1f49ee5fd57ce1f78411a333" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d95bdcb3762a5175b8faf87a08da98d06490bd24e235d4bc87ea8d424c09a61b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "fc5fe9ae04c1a54774c24945a8c4466ff73224af5e1d24b003a0aea2a5517944" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2613+0266017b5.tar.xz"
  version "0.12.0-dev.2613+0266017b5"
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
