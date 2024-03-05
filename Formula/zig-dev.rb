class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "aab0ccac0abb403474e98b0f850519b0edea908d4e3b27e23866dde53a48dedc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a8e132d44e285d9d9708c21416865883495f98a5266bac6ab1f47f3d2c20dc79" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8541634cfae4ded54b84c1022b09b1df27a2ed10ebc3dd39b8fc466b0a8336b9" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3154+0b744da84.tar.xz"
  version "0.12.0-dev.3154+0b744da84"
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
