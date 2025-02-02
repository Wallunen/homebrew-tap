class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "fff268ac4ec5c3f6191d9e81b5cbc827b88698cd9d655f54578261db7fe4425c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "97bbe06e51ad4be6464aec30734ce52bbb36b51f1357e02d6a444d4a9373f778" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7ed6e93bd7fad21aff3fd4acd9c5eb16e55c58c0311628dfe15eae60ed04c455" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3026+c225b780e.tar.xz"
  version "0.14.0-dev.3026+c225b780e"
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
