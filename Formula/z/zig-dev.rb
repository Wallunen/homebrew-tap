class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a6ead86fe2019a1f177c910cf6949782b180f16c9705093b2a1898e0e4b04043" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f44b03064424035f579e066c743d56097198e1837a8bbb1625fda94e23cd80f3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c6a385ee786693dda85d29d6469e2fa4f10c53768b10a18a3644e0b8891d36e4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2987+183bb8b08.tar.xz"
  version "0.14.0-dev.2987+183bb8b08"
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
