class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cb81a0a8abeb9f9a7deb9d26585ef3ddb1b3612bfc6814274ad45eddc26d35ea" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "b515ac88aa893047c0214f5e534ca06bf9ed3e394fbec4c9765259259dba56d2" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3af6ef3bad1b5083aad452c6389b03feedc46e25e2b7c66fc069f4ce6ff87ae6" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2517+debba652a.tar.xz"
  version "0.14.0-dev.2517+debba652a"
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
