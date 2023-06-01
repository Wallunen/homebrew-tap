class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "65f84c23da9372c1fc50bb9cf61a1ff1db6d107ef8e2432f5299a8ebdfe1f106" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "39c7cd12e35ac6357f4a086715915552b3804aabb691aa8589e11487bae41ac7" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "a224280c079f832000a71ce935aec23e8fd081e2223ec854e141199b5ad78054" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.3333+32e719e07.tar.xz"
  version "0.11.0-dev.3333+32e719e07"
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
