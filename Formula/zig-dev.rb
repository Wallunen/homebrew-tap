class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "db5c5a2f3c5b4092ea6b78b7ddfe5e485605cb9d4801a917302efc12050e581b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "954687ded9d3b7691d39078cadc8ad14cf2febb0e042003e8cdbeb1a9eb7c389" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f4134f5379f9759b8c855083850ce53a4f83cac05d4d3d27ae3b102a32349bf0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3596+fbb38a768.tar.xz"
  version "0.12.0-dev.3596+fbb38a768"
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
