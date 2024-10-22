class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "3a9b8eb82f5196055c101454ca71af657cfb387308ede2d94e2e444fc63b4430" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e12b4aa0f681f545e31d3ee11e076feae4e997ccfa9806b72d2d58246b46faf0" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "bdef8dec4540a774c23278becf794b3e3eb2bc31cb297e2b3d59de79adcfcd64" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.1952+9f84f7f92.tar.xz"
  version "0.14.0-dev.1952+9f84f7f92"
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
