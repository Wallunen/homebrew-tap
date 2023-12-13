class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "db0e7670e9b9f4211e9b06d3903f0ecee9531129e507abb6874cef100ea56025" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a18539d9214931ed630702bfc8dce26ce75750775b516405c1e5a32e872b840f" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f112e21c1781dd5e850a2545286ee2ccbc8eff98f4fa34437c84ce8022ea51c0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1819+5c1428ea9.tar.xz"
  version "0.12.0-dev.1819+5c1428ea9"
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
