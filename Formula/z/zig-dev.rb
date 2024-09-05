class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "04732994a80b60d2f05e374757c8918151d92eef8bac238ca543c7439dcf12d7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "76ab8732b9ea05446a5088d894518660af480d8938d090c24c8b93fb3619151d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "3551348338ea7d045bb6434284ceb769fd50786e13d0e110f92c89efe9995398" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1421+f87dd43c1.tar.xz"
  version "0.14.0-dev.1421+f87dd43c1"
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
