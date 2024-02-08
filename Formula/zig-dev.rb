class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "55c9b52919fa282db7578b21a2dd882f7b66782b1622afc63557b8e24cdc5947" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "183579612b9573443b6858cfd4fc7b9f1f000cc0074a87e3f2f12babf5cc24c0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "9967ef93958cd11cc1560fde322a79a667e77776f6f7061a3554da113b7d9041" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2644+42fcca49c.tar.xz"
  version "0.12.0-dev.2644+42fcca49c"
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
