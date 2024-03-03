class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "926cd8733bfb0f9c4a7559645efe8b053c28eee15de44a7a804587e889cb8877" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "394fb2f9aa866aa6686367ebe70b55c555021b031088250ba023f9251680912d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "5159035b9826b2cfaea628e6370ab4e564df8df55679f9ec1b7eec5b26b96914" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3142+9d500bda2.tar.xz"
  version "0.12.0-dev.3142+9d500bda2"
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
