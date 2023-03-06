class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6a2a7a59f7386eaa8d0fede0ebe7313a9891f24a6b388aa1622d211df7b2cd11" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7bd67e229d7a38c7fe4694e60e606594301317422d2994f0c63989d713ee7779" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d8b94f0b3e969c038d0e958ae18457880fcc2fa4b88204e4540ef6a497d39306" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1884+2641feb9b.tar.xz"
  version "0.11.0-dev.1884+2641feb9b"
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
