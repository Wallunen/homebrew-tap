class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2800311cb737f1b1f9f853f11258e07c531ce3a04406954004518b6691a9d4e9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c79ec3d352f783fa892a5d9d79010ae81f78d43d7967ae2bd03e79f3d4f12744" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "af55facffff89b3c1e73a5fd6196aded007d2862353a1533908454ea91c20ef1" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1733+648f592db.tar.xz"
  version "0.12.0-dev.1733+648f592db"
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
