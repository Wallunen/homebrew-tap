class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "cdd072b04f93909b588083bae5bfb363a6b39b5196bc32943191eb436e3d4344" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ff24568b647323e5f84e9ef13ab5fdf197accc3805394f3a82fe74b9b6ab0abd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "4037e8d5808cd209f7e68400bd5aefee8e0dc7f3efc5418da1bdf4f421556f94" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3940+8ce68e5f4.tar.xz"
  version "0.11.0-dev.3940+8ce68e5f4"
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
