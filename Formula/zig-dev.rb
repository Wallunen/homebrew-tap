class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bc92f238b8dfbc5056f2097534b4a04e5d86c8580fe262b7306ae3db1c822e71" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e42534da4cfcee575de80399992db4b829ad709137e1ac83fed6e8822957491b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e63a6c49eafe56ebe80d4d73051423aba805293eeecc96e570bcef820fdbfa5b" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3323+706bdf651.tar.xz"
  version "0.11.0-dev.3323+706bdf651"
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
