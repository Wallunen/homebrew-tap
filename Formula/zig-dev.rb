class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e45148fac4a8abbd2f7812c3acc3024360246d7fa03697835640f8bc11d44aca" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ecd70de1f4593abb5911004715930e1dc89561e6c4825fcb00da636cbef1dcaa" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0f8164b90b12330e9f604df1f73cf27a91f1e89502068668ef94e407dcb2c18a" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3031+f40539e5d.tar.xz"
  version "0.11.0-dev.3031+f40539e5d"
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
