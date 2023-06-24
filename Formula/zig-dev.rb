class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c2d9c86cab081b78653488a1607e2ed445a0c81cb1de36ecb2f92167bc56e781" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "db9d38c3726c5edb02248d8f8d1076b218f742b4311f39ace0a5cb18ecab05c0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "6ebd453a764ab9aeb3e23926543855725de53427c14933290707891c7a59bea8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3787+9d66481e3.tar.xz"
  version "0.11.0-dev.3787+9d66481e3"
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
