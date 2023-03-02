class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "848be9d2fe8ca2449f02acb71833bc34be97269b3340962812fb9bd99d0aadb0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4428451bff3aefa7ccba1c8d9178b9db5abf90b33367923986c5d7e578dc4c00" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "db95adfb28e172181bfd669c3abdc7a45cc504ccd86da9361e5683787b1a6c87" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1835+db8217f9a.tar.xz"
  version "0.11.0-dev.1835+db8217f9a"
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
