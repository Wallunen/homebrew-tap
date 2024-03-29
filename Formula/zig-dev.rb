class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "c6131af4f20c675f224a2d41d33273df0ef933b0f15d9b44929a68517d5bf7c1" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e4c5526d03bbbaa271eb8bd11be69ff06d5eb326aa4c90009aa81ac5eb081da6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "28712b4236b842afeb8278e8b65d3ab3a1e24cbbfcda5f9ab8b0e68c879ec5be" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3484+7aa42f47b.tar.xz"
  version "0.12.0-dev.3484+7aa42f47b"
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
