class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "49c178112855503e94b71b94858aabd5004fcace1368454fcb0f3bbfc137e699" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cf35b72626ba54ec906ba10fc468997037c57ce848471c82dea6da003441232f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8d9d2e38573c357be40d002fa9413742985f4598c28aab811964b298b5b1823e" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3268+9d4d96ca9.tar.xz"
  version "0.11.0-dev.3268+9d4d96ca9"
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
