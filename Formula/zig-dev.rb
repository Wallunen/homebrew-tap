class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c297340113451d146335fa02ab3904c917c3908c76551662d9cee04c11fae60c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "82a7f4705c28923229fd19bd376a1c9e5af310b85bbe9eaa7fda7391d0516222" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "54ecf667f8e08db62c0e2d345271dd4da6e4660762bdf930fdf081ec981de8f3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.2467+58bab660b.tar.xz"
  version "0.11.0-dev.2467+58bab660b"
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
