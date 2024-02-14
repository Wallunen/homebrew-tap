class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8de56d0477acd1ebcd8524e3ae3b3904462ebff1e09a7c7df14e7167752b6263" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "05a5f04efe888786748ee6384c6c989c8111ed1086c357791416bfcf6f1f063f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2ef958740a4434a34e209ffacd63e73ce432332267e0c41f6a7d58e9bb42556b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2741+d7563a775.tar.xz"
  version "0.12.0-dev.2741+d7563a775"
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
