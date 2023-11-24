class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "d499942262203f84136ef24eda957b5b17105adffe8fc59ff3274566a33260d7" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "f0c63fc88bac9e557484350849cee7311410a538c3880554c7b3ddc2d57f2875" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "63ce600266901607e155c668a97211c98d09390e139d50175a7851e23f23e2eb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1697+6fc20b3b0.tar.xz"
  version "0.12.0-dev.1697+6fc20b3b0"
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
