class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e5b66871ddc970a5c769055ccbec5a7a53a2755cedce09460eec741b15efe23e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "63650ec60b1a8d801f62eb59eb829ae299e3f9ff66d120554ddb4b595eb0d747" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "11c0581e464692ce8b4b346d5cc483541fe3176c70be492bc89e41d73c9430c1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.186+8f20e81b8.tar.xz"
  version "0.14.0-dev.186+8f20e81b8"
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
