class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8f76e7b30c13cddc62888662f23f59997d0250375f05a50403ac129cea137eb8" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c6ae79d6034546d3762d20068ca2328ce2905d5144d2fdce84c0b03fc8c77f04" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "962f846bd610783395bedebef5729812316c41190cbc962b60f68a7ce5573259" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2059+42389cb9c.tar.xz"
  version "0.12.0-dev.2059+42389cb9c"
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
