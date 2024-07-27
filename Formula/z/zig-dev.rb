class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "862f744bc7e8dc36e42ef511d6d6f7c69026d25f1592b055d323118649ba52c6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "34bae49d7cceedf8f5334625fa98a97abb47bef3f0ab48364ab1ed9dff06c486" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8f21f97c0908acfa389932b59e358b02aa6db5fa79ef231ddf05395e33d1e6c2" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.617+208baa37c.tar.xz"
  version "0.14.0-dev.617+208baa37c"
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
