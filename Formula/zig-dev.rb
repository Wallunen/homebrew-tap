class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "920b933fe5bfaa28549bb124c90b4c25dd14348febea72c43a9e7778749dc89e" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1b8bdd6e96cfc5061fc9b488dda4164464b1c3655f639f8f595438486800433a" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d95afc64f1ac49f3f8a51375a19386e2357286a62560fe929cc09570b3bdf4f4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.4187+1ae839cd2.tar.xz"
  version "0.11.0-dev.4187+1ae839cd2"
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
