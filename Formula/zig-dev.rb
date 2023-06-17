class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ed32fc01a4eaa1b4519755bdb9d2f622042526e7cfa00b2466ba03dd21505cb8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "2e7adaf35c4459836454ec9d456a56e015097540ea842cb5f1a136092e302023" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4158d1182857f802a05885409d3b7204b2b5bfd88dd1e3278cd1927a0d568d81" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3658+5d9e8f27d.tar.xz"
  version "0.11.0-dev.3658+5d9e8f27d"
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
