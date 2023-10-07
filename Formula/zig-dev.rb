class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ff7c450e184c544537b7b24b570e740afe8bf3642f25d7394e1f304f53a84e56" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a68239966aa99dc171f89e060b075763c173afc016fe5aad0775fc80bda867ed" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2e1ed83306eec2fa7bb0d2938ec6ae6b856e42ddb9d280f55bda03af9393e42b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.790+ad6f8e3a5.tar.xz"
  version "0.12.0-dev.790+ad6f8e3a5"
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
