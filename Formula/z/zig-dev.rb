class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "9336dfa3218de6f27184fb1ddb851145dd9483e3b21953d44b052973b30eb4b0" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "8dff2ef1521fff652e48beb72020104232b5b4f7474f93c5c25b28f3da277438" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "28d1fee989a37ef7e4191c17407b31032bfbd63c7b92505ec154f1b5b522bae8" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1730+034577555.tar.xz"
  version "0.14.0-dev.1730+034577555"
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
