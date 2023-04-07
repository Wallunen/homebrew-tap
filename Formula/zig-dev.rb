class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "65f07892503ffa5528a076754d54f099a8a3c63224fc6043a9ee5a30730fdb7f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "df9fb1494a256d11c96ed399898832be26693c252aae2b05a76a6268973c8da7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6a85d7c54dce26c4d1bd453621998b161987711a9dd7b81c1c73c75f883b9677" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2401+348751462.tar.xz"
  version "0.11.0-dev.2401+348751462"
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
