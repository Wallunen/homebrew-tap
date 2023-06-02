class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "f6a17097f0095d46a7aa483f84841dba1e2db84e6425506fab4dcea8bd800411" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c8893d1b7edca811326ba68368f6b7adda8773a4047349e7413f6ef09570116b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "544ed410862784749ea9729a28fb106d2cab6aa4d638b773c2d0aa4a4f03460a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3348+3faf376b0.tar.xz"
  version "0.11.0-dev.3348+3faf376b0"
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
