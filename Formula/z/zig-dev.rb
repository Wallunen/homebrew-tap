class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ac7362f0f4bfdc795962d090eda002d34336cc113f8141784ed15a930157eaef" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "df2d2c80906d762159d7ed483520605e1284377c5b5b886b90fc48d82364acfe" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a117828b54d7c92283e157806e930ea148af75547f70439762d8d12d66d9a972" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.989+a854ce302.tar.xz"
  version "0.14.0-dev.989+a854ce302"
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
