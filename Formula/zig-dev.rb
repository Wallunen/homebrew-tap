class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0c92a5fc0e1886d7f4b04875240f4bbe577b1fe0de7c3b3ae751490a7c724a81" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8d459a134c722ee826d7a6b8ab51502131a14edcd9ba916eccbc0602bf7ee81d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "209557933c54f00136ed51c4a23110e1a1e8e3d974ec35acfba4ee48dbc4aac9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.95+340a45683.tar.xz"
  version "0.12.0-dev.95+340a45683"
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
