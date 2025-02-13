class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "54cc6349482a9c6ba9611e9f66347c1b5672deccaceccf7152b766cf22cfd7ac" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d9bbf1b57bf7ba0c643c0de6445fc29ba910b157974be316745376ccfe88ddea" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ec99035493944689d729fb5169e512e151de490060af32fd37165d28852ab06d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.3213+53216d2f2.tar.xz"
  version "0.14.0-dev.3213+53216d2f2"
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
