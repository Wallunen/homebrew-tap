class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0d8f994072bbed12ef22607bd3ade9d52dbab3fa0636f3e0cd532dfdcd66872e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d0fe2b3b97b5c0b7b1f996920c303c3ddf9dcce3244bd8ea5c70bb8baa0af25a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2529029361f3abdcbfc975c09ed1bb413e4b7784ab312d0e9c9eac1d11190b54" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3713+54ea0bbcd.tar.xz"
  version "0.11.0-dev.3713+54ea0bbcd"
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
