class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ab7e3eaaaf5f248cde91c234fceba8549fe955d98d932ef438811419ea988527" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3158c6eec6218f2e5b3df9dea81490337606a141a5a19c831fa38a90ab2a9965" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3547577c36156c4240808ce6322e2be587370c638a88125a29dcf14a492422c1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3518+d2be725e4.tar.xz"
  version "0.12.0-dev.3518+d2be725e4"
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
