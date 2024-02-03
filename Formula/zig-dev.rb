class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5fb672a68f9461d7e1a815fb530ff4c4705989cbccf12d9b8b25a719dba7a385" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "47580bb59951f1aaf24b29dc1514e409e2470583c80d7d222c6bf360987a7c51" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "c4a36c3d643c9e9f7212a51e4b83caada37eea4be428cd7380d70961caf1e2d9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2543+9eda6ccef.tar.xz"
  version "0.12.0-dev.2543+9eda6ccef"
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
