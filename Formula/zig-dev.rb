class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "febd7e5cff7d38f4d6a6262db3a9daa9dfe1b74643e6b36bbceddec8554c2981" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "01c1bd78650ab41270f9ebb9352dfffa85b92c2b3d2c6f71bcd53962ea8f0a55" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "b57ab62b4a6c583d843e69e0bbb1c9645ae0366c18d471bd21d08ee1bf201549" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.2817+7461309b7.tar.xz"
  version "0.12.0-dev.2817+7461309b7"
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
