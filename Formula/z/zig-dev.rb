class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "36369a83aae918e1bdd78a0d7c26dc6f876f4f0b1a446213ebc2137f15b66956" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a243a2b166c68783f8474d8dbff3c0d8de4ada87d492913bbb57764213623401" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e345c2e5c72f5a25608fc68e3760627a21648f97ed8e11ca0963f0ff70bc0742" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1649+d3ba5f397.tar.xz"
  version "0.14.0-dev.1649+d3ba5f397"
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
